# encoding: utf-8
#
# Игра "Быки и коровы"
#
# (с) Nikolay Zhurilo (@mikolajan) https://github.com/mikolajan/

require 'byebug'

require_relative 'lib/game'
require_relative 'lib/words_reader'

# word = WordsReader.read_from_file(File.join(__dir__, 'data', 'words.txt')).sample
word = '1234'

game = Game.new(word)

puts 'Начинаем игру "Быки и коровы"'
puts "Загадано слово из #{game.hidden_word.length} букв"
puts game.hidden_word

input_word = ''

until game.finish?(input_word)
  game.checked_words.each { |k, v| puts "#{k}: #{v}"}

  puts "Введите слово для проверки из #{game.hidden_word.length} букв"

  input_word = gets.chomp.upcase

  while input_word.length != game.hidden_word.length
    puts input_word.length > game.hidden_word.length ? 'вы ввели слишком длинное слово' : 'вы ввели слишком короткое слово'
    puts "Введите слово для проверки из #{game.hidden_word.length} букв"

    input_word = gets.chomp.upcase
  end

  game.check_word(input_word)
end

puts 'конец'
