require 'minitest/autorun'
require 'minitest/pride'
require './lib/diagnostics'

class DiagnosticsTest < Minitest::Test
  def test_diagnostics_class_exists
    assert_instance_of Diagnostics, Diagnostics.new
  end

  def test_get_path
    expected = "Path: "
    assert_equal expected, Diagnostics.new.get_the_path("Path:")
  end

  def test_get_verb
    expected = "Verb: V"
    assert_equal expected, Diagnostics.new.get_the_verb("Verb:")
  end
end
