require "./pair"

class MyHash
  def initialize
    @pairs = [Pair.new("Gabe", 26)]
  end

  def [](key)
    # we need to find the pair with the given key
    found_pair = find_pair_with_key(key)

    if found_pair
      found_pair.value
    end
  end

  def []=(key, new_value)
    # find pair that has the same key
    found_pair = find_pair_with_key(key)
    # set that pair's value to the new value
    found_pair.value = new_value

    # if there's no pair with that key, then....????
    # create that pair and add it
  end

  private

  def find_pair_with_key(key)
    @pairs.find do |pair|
      pair.key == key
    end
  end
end

my_hash = MyHash.new

puts my_hash["Gabe"]
my_hash["Gabe"] = "possible highlander?"
puts my_hash["Gabe"]
