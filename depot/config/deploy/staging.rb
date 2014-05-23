set :app_server, '106.186.121.41'
set :app_url, 'li672-41.members.linode.com'
set :application, app_server
role :web, app_server
role :app, app_server
role :db,  app_server, :primary => true
set :deploy_to, "/var/www/AWRD"
set :user, "deploy"
set :rvm_ruby_string, 'ruby-2.0.0-p481'
set :branch, "master"
set :rails_env, "staging"
