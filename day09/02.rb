result = 0

def find_next(numbers)
  diffs = []
  0.upto(numbers.size - 2) do |i|
    diffs << numbers[i+1] - numbers[i]
  end
  if diffs.all?(&:zero?)
    return numbers.first
  else
    return numbers.first - find_next(diffs)
  end
end

File.readlines('./input.txt', chomp: true).each do |line|
  result += find_next(line.split(/\s+/).map(&:to_i))
end

puts result
