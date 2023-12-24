def sort_row(row)
  swaps = true
  while swaps do
    swaps = false
    row.each_with_index do |_, i|
      if (row[i] == '.') && (row[i+1] == 'O')
        row[i], row[i+1] = [row[i+1], row[i]]
        swaps = true
      end
    end
  end
  res = 0
  row.each_with_index do |val, i|
    res += (row.size - i) if val == 'O'
  end
  res
end

data = File.readlines('./input.txt', chomp: true).map {|r| r.split('')}.transpose

result = 0

data.each_with_index do |row, i|
  result += sort_row(row)
end

puts result
