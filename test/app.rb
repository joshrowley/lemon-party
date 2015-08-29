ENV['RACK_ENV'] = 'test'
$LOAD_PATH.unshift(File.expand_path('..', File.dirname(__FILE__)))

require 'app'
require 'minitest/autorun'
require 'minitest/reporters'
require 'rack/test'
require 'json'

Minitest::Reporters.use!(Minitest::Reporters::DefaultReporter.new(color: true))

module Test
  class App < Minitest::Test
    include Rack::Test::Methods

    def app
      Sinatra::Application
    end

    def json
      JSON.parse(last_response.body, symbolize_names: true)
    end

    def test_root_returns_yahoo_credentials
      get '/'
      assert_equal(YAHOO_CREDENTIALS, json)
    end
  end
end
