require 'pp'

class AocRange
  attr_reader :destination, :source, :length
  def initialize(destination, source, length)
    @destination = destination
    @source = source
    @length = length
  end

  def [](index)
    return source + index - destination if (index >= destination) && (index < destination + length)
  end
end

class Mapper
  attr_accessor :from, :to

  def initialize(from, to, map)
    @from = from
    @to = to
    create_ranges(map)
  end

  def create_ranges(map)
    @ranges = []
    map.each do |row|
      source, destination, length = row.split(/\s+/).map(&:to_i)
      @ranges << AocRange.new(destination, source, length)
    end
  end

  def [](ind)
    @ranges.each do |range|
      value = range[ind]
      return value if value
    end
    ind
  end
end

lines = File.readlines('./input.txt').to_a
seeds = lines[0].scan(/\d+/).map(&:to_i)
ind = 2
category = nil
items = []
maps = []
while ind < lines.size do
  line = lines[ind].gsub("\n", '')
  if category.nil?
    category = line.gsub(" map:", '')
    items = []
  elsif line.empty? || ind == lines.size - 1
    from, to = category.split('-to-')
    maps << Mapper.new(from, to, items)
    category = nil
    items = []
  else
    items << line
  end
  ind += 1
end


answer = nil
seeds.each do |seed|
  ind = seed
  path = ''
  maps.each do |map|
    ind = map[ind]
    path += ", #{map.to} ##{ind}"
  end
  answer = ind if answer.nil? || (ind < answer)
  # puts "seed #{seed} location is #{ind}#{path}"
end

puts answer
