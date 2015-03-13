print "Choose a number:\n"
number_chosen=STDIN.gets.chomp.to_f

if number_chosen%3==0 and not number_chosen%5==0 #is divisible by three and not divisible by 5
  print "FIZZ\n"

elsif number_chosen%5==0 and not number_chosen%3==0 #is divisible by five and not divisible by 3
  print "BUZZ\n"

elsif number_chosen%5==0 and number_chosen%3==0 #is divisible by five AND three
  print "FIZZBUZZ\n"
end

#could use ifelse if could remember how it was written
#could make each of the things a function (divisible_by_3, divisible_by_5) and then it would be
#def divisible_by_3 (number)  WOULD THAT WORK?
#  number%3==0
#end

#def divisible_by_5 (number)
#  number%5==0
#end

#if divisible_by_3 and not divisible_by_5
