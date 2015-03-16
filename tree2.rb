print "How many rows?\n"
number_of_rows=STDIN.gets.chomp.to_i
array=(1..number_of_rows).to_a

print " "*(number_of_rows-1) + "O\n"
array.each {|r| print " "*(number_of_rows-r) +"x"*(2*r-1) + "\n"}
print " "*((2*number_of_rows-1)/2-1) + "xxx\n"
