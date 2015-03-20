print "Please enter the word you would like to look up:"
word = STDIN.gets

dictionary = Hash.new

if dictionary[word] == nil
  print "What is the definition of this word?\n"
  definition = STDIN.gets
  dictionary[word] = definition
  #definition << dictionary
  print dictionary, "\n"
else
  print "The definition of #{word} is: #{dictionary[word]}\n"
end
