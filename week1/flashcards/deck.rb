class Deck
  attr_reader :name

  def initialize(name_and_cards)
    @name = name_and_cards[:name]
    @cards = name_and_cards[:cards]
  end

  def play
    @cards.each do |card|
      card.play
    end
  end
end
