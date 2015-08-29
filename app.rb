require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'json'
require 'oauth2'
require 'securerandom'

if development? || test?
  require 'dotenv'
  require 'pry'
  require 'sinatra/reloader'
  Dotenv.load
end

module Yahoo
  CREDENTIALS = {
    client_id: ENV['YAHOO_CLIENT_ID'],
    client_secret: ENV['YAHOO_CLIENT_SECRET']
  }

  REQUEST_TOKEN_URL = 'https://api.login.yahoo.com/oauth/v2/get_request_token'
end

get '/' do
  content_type :json

  client = OAuth2::Client.new(
    Yahoo::CREDENTIALS[:client_id],
    Yahoo::CREDENTIALS[:client_secret],
    site: Yahoo::REQUEST_TOKEN_URL
  )

  authorize_url = client.auth_code.authorize_url(
    oauth_consumer_key: Yahoo::CREDENTIALS[:client_id],
    oauth_nonce: SecureRandom.hex,
    oauth_signature_method: 'HMAC-SHA1',
    oauth_signature: Yahoo::CREDENTIALS[:client_secret],
    oauth_version: '2.0',
    oauth_callback: 'http://lemon-party.dev/callback'
  )

  redirect authorize_url
end
