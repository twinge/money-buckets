set :application, "money_buckets"
set :repository,  "git@github.com:twinge/money-buckets.git"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, "git"
set :scm_passphrase, "alt60m" #This is your custom users password
set :user, "deploy"
set :use_sudo, false


role :app, "mb.26am.com"
role :web, "mb.26am.com"
role :db,  "mb.26am.com", :primary => true

ssh_options[:forward_agent] = true
ssh_options[:port] = 40022

set :branch, "master"
set :deploy_via, :remote_cache
set :git_enable_submodules, 1

desc "Restart the web server"
deploy.task :restart, :roles => :app do
  run "touch #{deploy_to}/current/tmp/restart.txt"
end 

desc "Add linked files after deploy and set permissions"
task :after_update_code, :roles => :app do
  run "ln -s #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  run "ln -s #{shared_path}/tmp/sessions #{release_path}/tmp/sessions"
end


desc "Automatically run cleanup"
task :after_deploy, :roles => :app do
  deploy.cleanup
end

desc "Deploy with migration"
task :long_deploy do
  transaction do
    deploy.update_code
    # deploy.disable_web
    deploy.symlink
    deploy.migrate
  end

  deploy.restart
  deploy.cleanup
  # deploy.enable_web
end