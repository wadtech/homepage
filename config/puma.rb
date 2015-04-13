#!/usr/bin/env puma

workers Integer(ENV['WEB_CONCURRENCY'] || 1)
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count
preload_app!

rackup      DefaultRackup
environment ENV['RAILS_ENV'] || 'development'

bind "unix://#{ENV['RAILS_ROOT']}/tmp/puma/sock"
pidfile "#{ENV['RAILS_ROOT']}/tmp/puma/pid"
state_path "#{ENV['RAILS_ROOT']}/tmp/puma/state"

on_worker_boot do
  ActiveRecord::Base.establish_connection
end
