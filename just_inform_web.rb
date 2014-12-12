# web.rb
require 'bundler/setup'
Bundler.require(:default)
require 'just_inform'
require 'memcached'
require 'sinatra/base'
require "sinatra/json"

class JustInformWeb < Sinatra::Base
  CACHE = Memcached.new("localhost:11211")

  before do
    headers "Content-Type" => "text/html; charset=utf-8"
  end

  helpers Sinatra::JSON
  helpers do
    def render_page
      p = JustInform::Parser.new
      puts 'parsing burdens at ' + Time.now.to_s
      @burden = p.top(25, :burden)
      create_json_object_from_result('burden', @burden)
      
      puts 'parsing cost at ' + Time.now.to_s
      @cost = p.top(25, :cost)
      create_json_object_from_result('cost', @cost)

      puts 'parsing responses at ' + Time.now.to_s
      @responses = p.top(25, :responses)
      create_json_object_from_result('responses', @responses)
      
      puts 'creating content'
      @content = erb(:index, locals: {updated_at: Time.now})
      puts 'setting cache'
      CACHE.set("index", @content, 86400)
    end
    
    def create_json_object_from_result(type, result)
      results = []

      result.each_with_index do |f,i|
        result_hash = {}
        result_hash[:rank] = i+1
        result_hash[:title] = f[1].title
        result_hash[:data] = f[1].raw_data.to_s
        results << result_hash
      end
      CACHE.set(type, JSON.generate(results), 86400)
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

  get '/burden.json' do
    begin
      @burden = CACHE.get("burden")
      puts 'using cache - ' + Time.now.to_s
    rescue Memcached::NotFound
      render_page
    end

    @burden
  end

  get '/cost.json' do
    begin
      @cost = CACHE.get("cost")
      puts 'using cache - ' + Time.now.to_s
    rescue Memcached::NotFound
      render_page
    end

    @cost
  end

  get '/responses.json' do
    begin
      @responses = CACHE.get("responses")
      puts 'using cache - ' + Time.now.to_s
    rescue Memcached::NotFound
      render_page
    end

    @responses
  end
    
end