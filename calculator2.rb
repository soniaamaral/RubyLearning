print "Enter a series of numbers separated by spaces: "
series=STDIN.gets.chomp.split.map { |s| s.to_i }
print "The sum of the numbers is: #{series.reduce {|a, b| a+b}}\n"
print "The product of the number is: #{series.reduce {|a, b| a*b}}\n"
