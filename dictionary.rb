class Dictionary
  def initialize file_name
    @file_name = file_name
    @definitions = if File.exist?(file_name)
      Marshal.load(File.read(file_name, mode:"rb"))
    else
      Hash.new
    end
  end

  def get_definition_of word
    @definitions[word]
  end

  def add_word_definition word, definition
    @definitions[word] = definition
    File.open(@file_name, "wb") {|f| f.write(Marshal.dump(@definitions))}
  end
end

dictionary = Dictionary.new("dictionary.dat")

print "Please enter the word you would like to look up:"
word = STDIN.gets.chomp

definition = dictionary.get_definition_of(word)

if definition == nil
  print "What is the definition of this word?\n"
  definition = STDIN.gets.chomp
  dictionary.add_word_definition(word, definition)
end

print "The definition of #{word} is: #{definition}\n"
