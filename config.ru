#\ -p 3000

# Make sure we load all the gems
require 'bundler'
Bundler.require

# Then connect to the database
  set :database, {
  adapter: "postgresql", database: "restaurant_db",
  host: "localhost"
}

require './app.rb'
run EpicRestaurant
