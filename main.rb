# encoding: utf-8
#
# Игра "Быки и коровы"
#
# (с) Nikolay Zhurilo (@mikolajan) https://github.com/mikolajan/

require_relative 'lib/game'
require_relative 'lib/game_printer'
require_relative 'lib/words_reader'

word = WordsReader.read_from_file(File.join(__dir__, 'data', 'words.txt')).sample
# word = WordsReader.generate_hidden_word

game = Game.new(word)
game_printer = GamePrinter.new(game)

puts 'Начинаем игру "Быки и коровы"'

until game.finish?
  puts game_printer.print_progress

  input_word = game_printer.receive_word

  game.check_word(input_word)
end

puts game_printer.game_result
