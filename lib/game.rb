class Game
  attr_reader :hidden_word, :checked_words

  # введеные слова храним сразу с проверкой в хэше,
  # чтобы каждый раз не проверять при выводе введенных слов
  def initialize(hidden_word)
    @hidden_word = hidden_word.upcase

    @checked_words = {}
  end

  # заменяем в клоне ответа буквы чертой, которые учтены.
  # проверяем является ли буква быком, далее ищем корову,
  # но при условии, что эта буква с другим индексом не является быком
  def check_word(word)
    word = word.upcase
    answer_clone = hidden_word.clone

    bulls_counter = 0
    cows_counter = 0

    word.chars.each_with_index do |letter, index|
      case
      when answer_clone[index] == letter
        bulls_counter += 1

        answer_clone[index] == letter
      when answer_clone.include?(letter) && word[answer_clone.index(letter)] != letter
        cows_counter += 1

        answer_clone[answer_clone.index(letter)] = "_"
      end
    end

    @checked_words[word] = "#{bulls_counter}b#{cows_counter}c"
  end

  def finish?(word)
    lose?(word) || win?(word)
  end

  private

  def lose?(word)
    word == 'abort'
  end

  def win?(word)
    word == hidden_word
  end
end
