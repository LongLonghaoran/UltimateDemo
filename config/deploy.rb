# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

lock "~> 3.11.0"
set :application, 'UltimateDemo'
set :repo_url, 'git@github.com:LongLonghaoran/UltimateDemo.git'
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :deploy_to, '/home/longhr/www/UltimateDemo'
set :nginx_server_name, '104.225.147.236'
set :use_sudo, true
append :linked_dirs, 'node_modules', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'public/uploads'
namespace :deploy do
  before 'check:linked_files', 'puma:config'
  before 'check:linked_files', 'puma:nginx_config'
  after 'puma:restart', 'nginx:restart'
end

# set :application, "UltimateDemo"
# set :repo_url, "git@github.com:LongLonghaoran/UltimateDemo.git"
# set :nginx_server_name, '132.232.127.218'
# namespace :deploy do
#   before 'check:linked_files', 'puma:config'
#   before 'check:linked_files', 'puma:nginx_config'
#   after 'puma:restart', 'nginx:restart'
# end
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/home/longhr/www/UltimateDemo"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
