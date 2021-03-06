# ENV['SINATRA_ENV'] ||= "development"
# ENV['RACK_ENV'] ||= "development"

#require_relative '../controllers/application_controller.rb'
#Bundler.require(:default, ENV['SINATRA_ENV'])
# require_all './app'

Bundler.require
require 'bundler/setup'
require 'dotenv/load'
require_all 'app'


ActiveRecord::Base.establish_connection({
    :adapter => "sqlite3",
    :database => "db/food.sqlite3"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)