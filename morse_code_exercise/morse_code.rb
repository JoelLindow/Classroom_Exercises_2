require 'pry'

morse_dict = {
	"a" => ".-",
	"b" => "-...",
	"c" => "-.-.",
	"d" => "-..",
	"e" => ".",
	"f" => "..-.",
	"g" => "--.",
	"h" => "....",
	"i" => "..",
	"j" => ".---",
	"k" => "-.-",
	"l" => ".-..",
	"m" => "--",
	"n" => "-.",
	"o" => "---",
	"p" => ".--.",
	"q" => "--.-",
	"r" => ".-.",
	"s" => "...",
	"t" => "-",
	"u" => "..-",
	"v" => "...-",
	"w" => ".--",
	"x" => "-..-",
	"y" => "-.--",
	"z" => "--..",
	" " => " ",
	"1" => ".----",
	"2" => "..---",
	"3" => "...--",
	"4" => "....-",
	"5" => ".....",
	"6" => "-....",
	"7" => "--...",
	"8" => "---..",
	"9" => "----.",
	"0" => "-----"
}
output_morse = []
output_morse_split = []
output_translation =[]

puts ""
puts "What text would you like to convert to Morse Code?"
input_string = gets.chomp.downcase


input_string.split("").each do |letter|
    output_morse << morse_dict[letter]
end

puts "Your Code Is: #{output_morse.join}"
