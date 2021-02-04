class GamePrinter
 def initialize(game)
    @game = game
  end

  def print_input_words
    system "clear" or system "cls"

    if @game.checked_words.empty?
      puts 'Начинаем игру "Быки и коровы"'
    else
      @game.checked_words.each { |k, v| puts "#{k}: #{v}"}
    end
  end

  def receive_word
    input_word = get_word

    while input_word.length != @game.hidden_word.length && input_word != 'ABORT'
      puts input_word.length > @game.hidden_word.length ? 'Вы ввели слишком длинное слово' : 'Вы ввели слишком короткое слово'

      input_word = get_word
    end

    input_word
  end

  def game_result
    "Игра окончена. Правильно слово: #{@game.hidden_word}"
  end

  private

  def get_word
    print_input_word

    gets.chomp.upcase
  end

  def print_input_word
    puts "Введите слово для проверки из #{@game.hidden_word.length} букв"
  end
end
