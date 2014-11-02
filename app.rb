require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_record'
require 'sinatra/activerecord'
require 'sinatra/json'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'sqlite3://localhost/db/development.sqlite')

class User < ActiveRecord::Base
end

get '/status/all' do
  users = User.select(:username, :status, :updated_at)

  if users.present?
    json users
  else
    status 404
  end
end

post '/status/update' do
  user = User.find_by(username: params[:username])

  if user.present?
    user.status = params[:status]
    user.save
    json user
  else
    status 404
  end
end