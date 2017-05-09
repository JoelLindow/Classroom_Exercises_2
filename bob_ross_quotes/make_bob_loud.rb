original_input = File.open(ARGV[0], "r")

capitalized_text = original_input.map do |line|
  #line is a line from quiet_quotes
  line.upcase
end

File.open(ARGV[1], "w+").puts(capitalized_text)
