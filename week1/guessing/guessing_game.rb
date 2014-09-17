require "./round"

class GuessingGame
  NUMBER_OF_ROUNDS = 3

  def initialize
    @total_number_of_guesses = 0
  end

  def play
    puts "Hello, welcome to my game"

    NUMBER_OF_ROUNDS.times do
      round = Round.new
      round.play
      puts "You made #{round.number_of_guesses} guesses"
      @total_number_of_guesses += round.number_of_guesses
      number_of_guesses
    end

    puts "You did on average #{average_guesses} guess/round"
  end

  def average_guesses
    @total_number_of_guesses / NUMBER_OF_ROUNDS.to_f
  end
end

guessing_game = GuessingGame.new
guessing_game.play
