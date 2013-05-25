set :rvm_ruby_string, 'ruby-1.9.3-p0@farma'

server "173.246.40.9", :web, :app, :db, primary: true

set :user, "apps"
set :application, "farma.marczal.com"
set :deploy_to, "/home/#{user}/rails_apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "/home/#{user}/repos/#{application}.git"
set :local_repository, "#{user}@173.246.40.9:/home/#{user}/repos/#{application}.git"
set :branch, "master"

set :copy_exclude, %w(.git/* .svn/* log/* tmp/* .gitignore)

set :rails_env,       "production"

#default_run_options[:pty] = true
ssh_options[:forward_agent] = true

require "rvm/capistrano"
require "bundler/capistrano"

after "deploy", "deploy:cleanup" # keep only the last 5 releases
after "deploy", "deploy:ckeditor_link"
after 'deploy:update_code', 'deploy:update_crontab'

namespace :deploy do

  task :start, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop do ; end

  desc "Create ckeditor link"
  task :ckeditor_link do
    run "ln -s #{deploy_to}/shared/ckeditor_assets #{release_path}/public/ckeditor_assets"
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  desc "Update the crontab file"
  task :update_crontab, :roles => :app do
    run "cd #{release_path} && bundle exec whenever --update-crontab #{application} --set environment=production"
  end

  namespace :assets do
    desc "Precompile assets on local machine and upload them to the server."
    task :precompile, roles: :web, except: {no_release: true} do
      #run_locally "bundle exec rake assets:precompile"
      find_servers_for_task(current_task).each do |server|
        run_locally "rsync -vr --exclude='.DS_Store' public/assets #{user}@#{server.host}:#{shared_path}/"
      end
    end
  end
end
