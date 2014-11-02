require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_record'
require 'sinatra/activerecord'
require 'sinatra/json'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'sqlite3://localhost/db/development.sqlite')

get '/' do
  "hello"
end