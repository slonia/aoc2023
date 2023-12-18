def gen_var(limit)
  0.upto(limit).map do |speed|
    speed*(limit-speed)
  end
end

lines = File.readlines('./input.txt').to_a
times = lines[0].scan(/\d+/).map(&:to_i)
distances = lines[1].scan(/\d+/).map(&:to_i)

answer = 1

times.each_with_index do |time, i|
  answer *= gen_var(time).select { |a| a > distances[i] }.count
end

puts answer
