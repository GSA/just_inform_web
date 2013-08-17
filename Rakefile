desc "Wipe the memcache"
task :wipe_cache do
  require 'memcached'
  puts "Wiping cache..."
  Memcached.new.delete('index')
end