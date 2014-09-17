class Card
  def initialize(front, back)
    @front = front
    @back = back
  end

  def play
    puts "Front is #{@front}, back is #{@back}"
  end
end
