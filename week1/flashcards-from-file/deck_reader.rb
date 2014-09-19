require "./deck"
require "./card"

class DeckReader
  def initialize(file_name)
    @file = File.open(file_name, "r")
    @number_of_decks = get_line.to_i
  end

  def get_decks
    @number_of_decks.times.map do
      read_deck
    end
  end

  private

  def get_line
    @file.gets.chomp
  end

  def read_deck
    name = get_line
    number_of_cards = get_line.to_i
    cards = number_of_cards.times.map do
      read_card
    end
    Deck.new({ name: name, cards: cards })
  end

  def read_card
    front = get_line
    back = get_line
    Card.new({ front: front, back: back})
  end
end
