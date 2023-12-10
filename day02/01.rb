result = 0

GAME = /(?<num>\d+) (?<color>blue|red|green)/
VALID_NUMS = {
  'red' => 12,
  'green' => 13,
  'blue' => 14
}
File.readlines('./input.txt').each do |line|
  game, data = line.split(': ')
  rounds = data.split('; ')
  round_valid = rounds.all? do |round|
    colors = round.split(', ')
    game_results = {}
    colors.each do |color_line|
      res = color_line.match(GAME)
      game_results[res[:color]] = res[:num].to_i
    end
    # TODO: early exit on first non-matching color
    valid = game_results.all? do |col, num|
      VALID_NUMS[col] >= num
    end
  end
  result += game[/\d+/].to_i if round_valid
end

puts result
