require 'minitest/autorun'
require 'minitest/pride'
require './lib/shutdown'
require 'pry'

class ShutdownTest < Minitest::Test
  def test_shutdown_class_exists
    assert_instance_of Shutdown, Shutdown.new
  end
end
