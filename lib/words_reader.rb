module WordsReader
  LENGTH_HIDDEN_WORD = 4

  def self.read_from_file(file_name)
    abort "Файл с вопросами по указанному пути не найден" unless File.exist?(file_name)

    File.readlines(file_name, chomp: true)
  end

  def self.generate_hidden_word
    [*0..9].shuffle.first(LENGTH_HIDDEN_WORD).join
  end
end
