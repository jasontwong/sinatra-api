require "rubygems"
require "bundler/setup"
require_relative "sinatra_api/helpers"
require_relative "sinatra_api/error"
require_relative "sinatra_api/base"
require_relative "sinatra_api/v0"

module SinatraAPI
  DEV_KEY = 'apikey'
end
