print "Please enter the word you would like to look up:"
word = STDIN.gets

dictionary = Hash.new

if dictionary[word] == nil
  print "What is the definition of this word?"
  definition = STDIN.gets
  dictionary[word] = definition
  #definition << dictionary
  print dictionary
elseif
  print dictionary[word]
end
