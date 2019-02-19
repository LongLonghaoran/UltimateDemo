git pull
bundle install
kill `cat /home/longhr/projects/UltimateDemo/tmp/pids/server.pid`
RAILS_ENV=production rake db:migrate
RAILS_ENV=production rake assets:precompile
RAILS_SERVE_STATIC_FILES=true RAILS_ENV=production rails s -b 0.0.0.0 -d