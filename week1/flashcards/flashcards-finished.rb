# Students should put each class in a separate file.

class Deck
  attr_reader :name

  def initialize(name, cards)
    @name = name
    @cards = cards
  end

  def play
    display_welcome
    cards.shuffle.each { |card| card.play }
    puts
  end

  private

  attr_reader :cards

  def display_welcome
    message = "Now playing the #{name} deck"
    puts message
    puts "-" * message.length
  end
end

class Card
  def initialize(attributes)
    @front = attributes[:front]
    @back = attributes[:back]
  end

  def play
    guess = get_guess

    if correct?(guess)
      puts "Correct!"
    else
      puts "Incorrect, the answer was #{back}"
    end
  end

  private

  attr_reader :front, :back

  def get_guess
    print "#{front} > "
    gets.chomp
  end

  def correct?(guess)
    back == guess
  end
end

class FlashcardGame
  def initialize(decks)
    @decks = decks
  end

  def play
    loop do
      deck = choose_deck
      if deck
        deck.play
      else
        break
      end
    end
  end

  private

  attr_reader :decks

  def choose_deck
    puts "Which deck? (just hit enter to stop playing)"
    decks.each do |deck|
      puts deck.name
    end

    print "> "

    deck_name = gets.chomp
    decks.find { |deck| deck.name == deck_name }
  end
end

spanish_cards = []
spanish_cards << Card.new({ front: "Perro", back: "Dog" })
spanish_cards << Card.new({ front: "Gato", back: "Cat" })
spanish_deck = Deck.new("Spanish", spanish_cards)

japanese_cards = []
japanese_cards << Card.new({ front: "Inu", back: "Dog" })
japanese_cards << Card.new({ front: "Neko", back: "Cat" })
japanese_deck = Deck.new("Japanese", japanese_cards)

decks = [spanish_deck, japanese_deck]

flashcard_game = FlashcardGame.new(decks)
flashcard_game.play
