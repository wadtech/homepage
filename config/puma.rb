#!/usr/bin/env puma

environment ENV['RACK_ENV'] || 'development'

threads 1, 16
preload_app!
worker_timeout 60
