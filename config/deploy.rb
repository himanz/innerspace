set :default_stage, 'development'
set :stages, %w(production staging development)
require 'capistrano/ext/multistage'
require 'bundler/capistrano'

set :application, "scoutingit"
set :repository,  "git@github.com:himanz/innerspace.git"
set :deploy_to, '/var/www/scoutingit'
set :scm, :git
set :branch, 'master'
set :user, 'jonos'
set :deploy_via, :copy
set :keep_releases, 5
set :use_sudo, false
set :ssh_options, {:forward_agent => true}


after "deploy:restart", "deploy:cleanup"

namespace :deploy do

  desc "symlink shared files"
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/system/mongoid.yml #{release_path}/config/mongoid.yml"
    run "ln -nfs #{shared_path}/system/application.yml #{release_path}/config/application.yml"
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

end
before "deploy:assets:precompile", "deploy:symlink_shared"