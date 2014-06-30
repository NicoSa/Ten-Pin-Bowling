env = ENV["RACK_ENV"] || "development"
database_url = ENV["DATABASE_URL"] || "postgres://localhost/ten_pin_bowling_#{env}"

require 'data_mapper'
require 'dm-timestamps'
require_relative '../server.rb'

DataMapper.setup(:default, database_url)

DataMapper.finalize

DataMapper.auto_upgrade!
