number_to_guess = rand(1..10)

print "The computer has chosen a number between 1 and 10, both inclusive.  Guess the number.\n"

begin
  print "What do you think the number is?\n"
  user_number=STDIN.gets.chomp.to_i
  if user_number>number_to_guess
    print "Your number is too big.\n"
  elsif user_number<number_to_guess
    print "Your number is too small.\n"
  end
end until user_number==number_to_guess

print "Congratulations, you guessed correctly.\n"
