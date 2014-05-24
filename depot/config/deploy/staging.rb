set :app_server, 'play.huangxingxing.info'
set :app_url, 'http://depot.huangxingxing.info'
set :application, app_server
role :web, app_server
role :app, app_server
role :db,  app_server, :primary => true
set :deploy_to, "/var/www/depot.huangxingxing.info"
set :user, "deploy"
set :rvm_ruby_string, 'ruby-2.0.0-p481'
set :branch, "master"
set :rails_env, "staging"
