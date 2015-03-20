print "Please enter the word you would like to look up:"
word = STDIN.gets

dictionary = Hash.new

File.open("out_file.txt", "r")

if dictionary[word] == nil
  print "What is the definition of this word?\n"
  definition = STDIN.gets
  dictionary[word] = definition
  print "The definition of #{word} is: #{dictionary[word]}\n"
  out_file = File.open("out_file.txt", "a") {|f| f.write(dictionary)}
else
  print "The definition of #{word} is: #{dictionary[word]}\n"
end
