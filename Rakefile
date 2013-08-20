require './just_inform_web'

desc "Wipe the memcache"
task :wipe_cache do
  puts "Wiping cache..."
  Memcached.new("localhost:11211").flush
  puts "Clean as a whistle"
end

desc "Add new data in memcache"
task :add_cache do  
  app = JustInformWeb.allocate
  app.send :initialize
  app.render_page
end

desc 'Regenerate Cache'
task :regenerate_cache do
  Rake::Task["wipe_cache"].invoke
  Rake::Task["add_cache"].invoke
end