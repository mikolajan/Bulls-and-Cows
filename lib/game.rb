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
    @last_input_word = word.upcase
    answer_clone = hidden_word.clone

    bulls_counter = 0
    cows_counter = 0

    word.chars.each_with_index do |letter, index|
      case
      when answer_clone[index] == letter
        bulls_counter += 1

        answer_clone[index] = '_'
      when answer_clone.include?(letter)
        answer_clone.chars.each_with_index do |l, j|
          if letter == l && answer_clone[j] != word[j]
            cows_counter += 1
            answer_clone[j] = "_"

            break
          end
        end
      end
    end

    @checked_words[word] = "#{bulls_counter}b#{cows_counter}c"
  end

  def finish?
    lose? ? lose? : win?
  end

  private

  def lose?
    @last_input_word&.downcase == 'abort'
  end

  def win?
    @last_input_word == @hidden_word
  end
end
