require 'minitest/autorun'
require 'minitest/pride'
require './lib/hello_world'
require 'pry'

class HelloWorldTest < Minitest::Test
  def test_hello_world_class_exists
    assert_instance_of HelloWorld, HelloWorld.new
  end

  def test_hello_world_counter
    t = HelloWorld.new
    99.times{t.count}
    assert_equal 100, t.count
  end

  def test_hello_world_response
    t = HelloWorld.new
    expected = "Hello, World! 1"
    assert_equal expected, t.hello_response
  end
end
