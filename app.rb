require 'rubygems'
require 'bundler/setup'
require 'dotenv'
require 'sinatra'
require 'json'
require 'pry'

Dotenv.load

get '/' do
  content_type :json

  response = {
    client_id: ENV['YAHOO_CLIENT_ID'],
    client_secret: ENV['YAHOO_CLIENT_SECRET']
  }

  response.to_json
end
