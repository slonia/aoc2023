
result = 0

File.readlines('./input.txt').each_with_index do |line, i|
  line = line.gsub(/Card \d+: /, '')
  winning, mine = line.split(' | ')
  winning = winning.split(/\s+/)
  mine = mine.split(/\s+/)
  overlap = winning & mine
  cnt = overlap.size
  if cnt > 0
    row_res = 2**(cnt-1)
    result += row_res
    # puts "result for line #{i+1} is #{row_res}"
  end
end

puts result
