require 'bundler/capistrano'

set :application, "scoutingit"
set :repository,  "git@github.com:himanz/innerspace.git"

set :user, 'jonos'
set :deploy_to, "/home/jonos/scoutingit"
set :use_sudo, false

set :rails_env, "production"

set :scm, :git

default_run_options[:pty] = true

role :web, "104.131.236.37"                          # Your HTTP server, Apache/etc
role :app, "104.131.236.37"                          # This may be the same as your `Web` server

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end