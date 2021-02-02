module WordsReader
  def self.read_from_file(file_name)
    abort "Файл с вопросами по указанному пути не найден" unless File.exist?(file_name)

    File.readlines(file_name, chomp: true)
  end
end
