result = 0

def find_next(numbers)
  diffs = []
  0.upto(numbers.size - 2) do |i|
    diffs << numbers[i+1] - numbers[i]
  end
  # puts diffs
  if diffs.all?(&:zero?)
    return numbers.last
  else
    return numbers.last + find_next(diffs)
  end
end

File.readlines('./input.txt', chomp: true).each do |line|
  result += find_next(line.split(/\s+/).map(&:to_i))
end

puts result
