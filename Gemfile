source 'https://rubygems.org'

gem 'devise'
gem 'execjs'

#使用mysql2驱动mysql数据库
gem 'mysql2'

#使用bootstrap-sass构建页面
gem 'bootstrap-sass', '~> 3.3.6'

# 使用carrierwave实现文件上传的功能
gem 'carrierwave'

#使用grape写api
gem  'grape', ">= 1.1.0"

#摒弃erb使用haml
gem 'haml'
gem 'haml-rails'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
gem 'puma'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.3.6'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'bootsnap', require: false

gem 'sidekiq'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# amazon s3 upload
gem "aws-sdk-s3", require: false

# 网络请求
gem 'rest-client'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # 项目部署
  gem "capistrano", "~> 3.10", require: false
  gem "capistrano-rails", "~> 1.3", require: false
  gem 'capistrano3-puma'
  gem 'capistrano-rvm'
  gem 'capistrano3-nginx', '~> 2.0'
  gem 'capistrano-upload-config'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'listen'
end
