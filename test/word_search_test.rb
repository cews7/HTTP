require 'minitest/autorun'
require 'minitest/pride'
require './lib/word_search'

class WordSearchTest < Minitest::Test
  def test_word_search_class_exists
    assert_instance_of WordSearch, WordSearch.new
  end

  def test_word_search_has_dictionary
    t = WordSearch.new
    assert t.dictionary.include?("a")
    assert t.dictionary.include?("aa")
  end

  def test_word_search_has_response
    t = WordSearch.new
    expected = "a is a known word"
    assert_equal expected, t.word_search_response("a")
    expected_1 = "aawefawe is not a known word"
    assert_equal expected_1, t.word_search_response("aawefawe")
  end
end
