require 'minitest/autorun'
require 'minitest/pride'
require './lib/date_time'

class DateTimeTest < Minitest::Test
  def test_date_time_class_exists
    assert_instance_of DateTime, DateTime.new
  end
  
  def test_time_is_formatted
    expected = Time.now.strftime("%I %M %p on %A, %B %e, %Y")
    assert_equal expected, DateTime.new.date_time_response
  end
end
