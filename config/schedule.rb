# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
#
# Learn more: http://github.com/javan/whenever

set :output, { :standard => "/home/wadtech/webapps/rails/shared/log/cron_log.log", :error => "/home/wadtech/webapps/rails//shared/log/cron_error.log" }
set :path, '/home/wadtech/webapps/rails/current/'

every 10.minutes do
  rake 'tweet:update'
end