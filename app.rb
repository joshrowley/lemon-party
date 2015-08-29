require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'json'

if development? || test?
  require 'dotenv'
  require 'pry'
  require 'sinatra/reloader'
  Dotenv.load
end

YAHOO_CREDENTIALS = {
  client_id: ENV['YAHOO_CLIENT_ID'],
  client_secret: ENV['YAHOO_CLIENT_SECRET']
}

get '/' do
  content_type :json
  YAHOO_CREDENTIALS.to_json
end
