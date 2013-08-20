require 'bundler/capistrano'
require "rvm/capistrano"
require "whenever/capistrano"

set :application, "just_inform_web"
set :scm, "git"
set :repository, "https://github.com/GSA-OCSIT/just_inform_web.git"
set :use_sudo, false
#set :deploy_via, :remote_cache
set :whenever_command, "bundle exec whenever"

set :user, "ubuntu"
set :deploy_to, "/var/www/#{application}"
set :domain, "54.221.226.158"
set :keep_releases, 6

role :web, "#{domain}"                          # Your HTTP server, Apache/etc
role :app, "#{domain}"                          # This may be the same as your `Web` server
role :db,  "#{domain}", :primary => true        # This is where Rails migrations will run

after "deploy:restart", "deploy:cleanup"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  desc "Add config dir to shared folder"
  task :add_shared_config do
    run "mkdir -p #{deploy_to}/shared/config"
  end
end