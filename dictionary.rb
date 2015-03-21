print "Please enter the word you would like to look up:"
word = STDIN.gets.chomp

if File.exist?("dictionary.dat")
  dictionary = Marshal.load(File.read("dictionary.dat", mode:"rb"))
else
  dictionary = Hash.new
end

definition = dictionary[word]

if definition == nil
  print "What is the definition of this word?\n"
  definition = STDIN.gets.chomp
  dictionary[word] = definition
  File.open("dictionary.dat", "wb") {|f| f.write(Marshal.dump(dictionary))}
end

print "The definition of #{word} is: #{definition}\n"
