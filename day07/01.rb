class Card
  include Comparable

  attr_reader :value

  VALUES = {
    'T' => 10,
    'J' => 11,
    'Q' => 12,
    'K' => 13,
    'A' => 14
  }

  def initialize(value)
    @value = VALUES[value] || value.to_i
  end

  def <=>(other)
    value <=> other.value
  end

  def inspect
    value.to_s
  end
end

class Hand
  include Comparable

  attr_reader :str, :cards, :first_order, :second_order, :bid

  def initialize(str, bid)
    @str = str
    @cards = str.split('').map { |v| Card.new(v) }
    @bid = bid
    set_first_order
    set_second_order
  end

  def <=>(other)
    for_sorting <=> other.for_sorting
  end

  def for_sorting
    [first_order, second_order].flatten
  end

  def inspect
    str
  end

  private

  def set_first_order
    counts = {}
    cards.each do |c|
      key = c.value
      if counts[key]
        counts[key] += 1
      else
        counts[key] = 1
      end
    end
    @first_order = if counts.values.last == 5
      6
    elsif counts.values.include?(4)
      5
    elsif counts.values.include?(3) && counts.values.include?(2)
      4
    elsif counts.values.include?(3)
      3
    elsif counts.values.include?(2) && (counts.values.size == 3)
      2
    elsif counts.values.include?(2)
      1
    else
      0
    end
  end

  def set_second_order
    @second_order ||= @cards.map(&:value)
  end
end

hands = File.readlines('./input.txt', chomp: true).map {|s| s.split(' ') }
hands = hands.map { |hand| Hand.new(hand[0], hand[1].to_i) }

answer = 0
hands.sort.each_with_index do |hand, rank|
  # puts "#{hand.inspect}, rank: #{rank+1}, bid: #{hand.bid}"
  answer += (rank + 1) * hand.bid
end

puts answer
