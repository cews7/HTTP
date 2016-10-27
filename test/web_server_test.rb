require 'minitest/autorun'
require 'minitest/pride'
require './lib/web_server'
require 'pry'
require 'faraday'

class WebServerTest < Minitest::Test
  def test_web_server_class_exits
    assert_instance_of WebServer, WebServer.new 
  end
end
