git pull
bundle install
RAILS_ENV=production rake db:migrate
RAILS_ENV=production rake assets:precompile
RAILS_ENV=production rails s -b 0.0.0.0 -d