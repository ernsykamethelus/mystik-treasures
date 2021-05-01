# ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default)
# Bundler.require(:default, ENV['SINATRA_ENV'])

# ActiveRecord::Base.establish_connection(
#   :adapter => "sqlite3",
#   :database => "db.sqlite"
# )

require './app/controllers/application_controller'
require_all 'app'

set :database, {adapter: "sqlite3", database: "db/crystals.sqlite3"}
