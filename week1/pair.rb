class Pair
  def initialize(key, value)
    @key = key
    @value = value
  end

  attr_reader :key
  attr_accessor :value
end
