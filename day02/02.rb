result = 0

GAME = /(?<num>\d+) (?<color>blue|red|green)/

File.readlines('./input.txt').each do |line|
  game, data = line.split(': ')
  rounds = data.split('; ')
  game_results = {}
  round_valid = rounds.all? do |round|
    colors = round.split(', ')
    colors.each do |color_line|
      res = color_line.match(GAME)
      key = res[:color]
      num = res[:num].to_i
      game_results[key] = num if !game_results.key?(key) || game_results[key] < num
    end
  end
  result += game_results.values.inject(:*)
end

puts result
