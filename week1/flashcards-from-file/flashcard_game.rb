require "./deck"
require "./card"

class FlashcardGame
  def initialize(decks)
    @decks = decks
  end

  def play
    loop do
      list_out_decks
      deck = ask_user_which_deck
      if deck
        puts "would play #{deck.name}"
        deck.play
      else
        puts "exiting"
        break
      end
    end
  end

  private

  def list_out_decks
    @decks.each do |deck|
      puts deck.name
    end
  end

  def ask_user_which_deck
    print "Which deck would you like (leave blank to exit) > "
    requested_deck_name = gets.chomp
    @decks.find { |deck| deck.name == requested_deck_name }
  end
end

decks = []

spanish_cards = []
spanish_cards << Card.new({ front: "Gato", back: "Cat"})
spanish_cards << Card.new({ front: "Perro", back: "Dog"})
decks << Deck.new({ name: "Spanish", cards: spanish_cards})

japanese_cards = []
japanese_cards << Card.new({ front: "Neko", back: "Cat"})
japanese_cards << Card.new({ front: "Inu", back: "Dog"})
decks << Deck.new({name: "Japanese", cards: japanese_cards})

flashcard_game = FlashcardGame.new(decks)
flashcard_game.play
