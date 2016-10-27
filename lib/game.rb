class Game
  attr_reader :random_number,
              :guess_count

  def initialize
    @guess_count = 0
  end

  def start_game
    @random_number = rand(101)
    "Good luck!"
  end

  def game_feedback(guess)
    @guess_count += 1
    if guess.to_i.eql?(@random_number)
      "You win! You've taken #{@guess_count} guesses"
    elsif guess.to_i > @random_number
      "Guess is too high and you've taken #{@guess_count} guesses"
    else
      "Guess is too low and you've taken #{@guess_count} guesses"
    end
  end
end
