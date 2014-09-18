class Card
  def initialize(front_and_back)
    @front = front_and_back[:front]
    @back = front_and_back[:back]
  end

  def play
    puts "Front is #{@front}, back is #{@back}"
  end
end
