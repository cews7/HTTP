require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require "pry"

class GameTest < Minitest::Test
  def test_game_class_exists
    assert_instance_of Game, Game.new
  end

  def test_start_game_returns_string
    game = Game.new
    assert_equal "Good luck!", game.start_game
  end

  def test_random_number_inside_start_game
    game = Game.new
    game.start_game
    assert game.random_number.class.eql?(Fixnum)
  end

  def test_random_number_is_random
    game = Game.new
    game.start_game
    x = [*1..101]
    assert x.include?(game.random_number)
  end

  def test_game_feedback_guess_is_too_high
    game = Game.new
    game.start_game
    actual = game.game_feedback(101)
    expected = "Guess is too high and you've taken 1 guesses"
    assert expected.eql?(actual)
  end

  def test_game_feedback_guess_is_too_low
    game = Game.new
    game.start_game
    actual = game.game_feedback(-1)
    expected = "Guess is too low and you've taken 1 guesses"
    assert_equal expected, actual
  end

  def test_game_feedback_returns_win_string_when_guess_is_equal_to_random_number
    game = Game.new
    game.start_game
    actual = game.game_feedback(game.random_number)
    expected = "You win! You've taken #{game.guess_count} guesses"
    assert actual.eql?(expected)
  end
end
