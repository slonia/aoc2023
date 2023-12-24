def calc_hash(str)
  curr = 0
  str.each_byte do |code|
    curr += code
    curr *= 17
    curr %= 256
  end
  curr
end

result = 0

File.read('./input.txt').chomp.split(',').each do |str|
  result += calc_hash(str)
end

puts result
