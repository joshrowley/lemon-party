require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'json'

if development?
  require 'dotenv'
  require 'pry'
  require 'sinatra/reloader'
  Dotenv.load
end

get '/' do
  content_type :json

  response = {
    client_id: ENV['YAHOO_CLIENT_ID'],
    client_secret: ENV['YAHOO_CLIENT_SECRET']
  }

  response.to_json
end
