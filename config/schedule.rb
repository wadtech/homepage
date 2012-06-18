# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
#
# Learn more: http://github.com/javan/whenever

set :output, "$RAILS_HOME/shared/log/cron_log.log"
set :path, "$RAILS_HOME/current/"

job_type :runner,  "cd :path && script/rails runner -e :environment ':task' :output"

every 10.minutes do
  rake 'tweet:update'
end