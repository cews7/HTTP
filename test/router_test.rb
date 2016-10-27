require 'minitest/autorun'
require 'minitest/pride'
require './lib/router'
require 'faraday'

class RouterTest < Minitest::Test
  def test_router_class_exists
    assert_instance_of Router, Router.new
  end

  def test_check_path
    r = Router.new
    request_lines = ["GET / HTTP/1.1",
                     "Host: localhost:9292",
                     "Connection: keep-alive",
                     "Cache-Control: no-cache",
                     "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36",
                     "Postman-Token: ddcd2a13-5ef8-ab83-dde5-e33eb4323c50",
                     "Accept: */*",
                     "Accept-Encoding: gzip, deflate, sdch",
                     "Accept-Language: en-US,en;q=0.8"]

    assert_equal "Path: /", r.check_path(request_lines)
  end
end
