result = 0

File.readlines('./input.txt').each do |line|
  numbers = line.scan(/\d/)
  result += 10*numbers[0].to_i + numbers[-1].to_i
end
puts result
