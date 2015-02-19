#Inputing text
words=STDIN.read.split(/[ \.,\n:;]+/).map {|word| word.upcase}
word_frequencies=Hash.new
words.each { |word|
if word_frequencies[word]==nil
  word_frequencies[word]=1
else
  word_frequencies[word]=word_frequencies[word] + 1 #shortcut for this is +=
end
}

word_frequencies.to_a.sort {|left, right| right[1]<=>left[1]}.take(5).each {|word, frequency| print "#{word}: #{frequency}\n"}
