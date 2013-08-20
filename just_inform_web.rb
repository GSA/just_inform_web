# web.rb
require 'bundler/setup'
Bundler.require(:default)
require 'just_inform'
require 'memcached'
require 'sinatra/base'

class JustInformWeb < Sinatra::Base
  CACHE = Memcached.new("localhost:11211")

  before do
    headers "Content-Type" => "text/html; charset=utf-8"
  end
  
  helpers do
    def render_page
      p = JustInform::Parser.new
      puts 'parsing burdens at ' + Time.now.to_s
      @burden = p.top(25, :burden)
      puts 'parsing cost at ' + Time.now.to_s
      @cost = p.top(25, :cost)
      puts 'parsing responses at ' + Time.now.to_s
      @responses = p.top(25, :responses)
      
      puts 'creating content'
      @content = erb(:index, locals: {updated_at: Time.now})
      puts 'setting cache'
      CACHE.set("index", @content, 86400)
    end
  end
  
  get '/' do
    begin
      @content = CACHE.get("index")
      puts 'using cache - ' + Time.now.to_s
    rescue Memcached::NotFound
      render_page
    end

    @content
  end
end