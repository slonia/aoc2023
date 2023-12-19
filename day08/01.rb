file = File.readlines('./input.txt', chomp: true).to_a
directions = file[0].split('')

nodes = {}

file[2..].each do |row|
  key, neighbours = row.split(' = ')
  neighbours = neighbours.scan(/[A-Z]+/)
  nodes[key] = {
    'L' => neighbours[0],
    'R' => neighbours[1]
  }
end

direction_index = 0
current_node = 'AAA'
step_num = 0

while current_node != 'ZZZ' do
  current_node = nodes[current_node][directions[direction_index]]
  direction_index += 1
  direction_index = 0 if direction_index == directions.size
  step_num += 1
end

puts step_num
