# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "UltimateDemo"
set :repo_url, "git@github.com:LongLonghaoran/UltimateDemo.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/UltimateDemo"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/master.key"

set :linked_files, %w{config/master.key config/database.yml}

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"
append :linked_dirs, "log", "tmp/pids", "tmp/sockets"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

set :rvm_ruby_version, '2.5.0@UltimateDemo'

# 当nginx安装目录与默认目录 /etc/nginx不一致时，需要手动设置覆盖默认路径
set :nginx_sites_available_path, "/usr/local/nginx/sites-available"
set :nginx_sites_enabled_path, "/usr/local/nginx/sites-enabled"