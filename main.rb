# encoding: utf-8
#
# Игра "Быки и коровы"
#
# (с) Nikolay Zhurilo (@mikolajan) https://github.com/mikolajan/

require 'byebug'

require_relative 'lib/words_reader'

words = WordsReader.read_from_file(File.join(__dir__, 'data', 'words.txt'))
