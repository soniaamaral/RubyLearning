print "Please enter your coefficients leaving a space between each\n"
coefficients=STDIN.gets.chomp.split.map { |s| s.to_f }


a, b, c = coefficients

  delta = b*b - 4*a*c
  if a == 0
    if b == 0
      print "There are no roots\n"
    else
      linear = -c/b
      print "The answer is #{linear}\n"
    end
  elsif delta < 0
    print "There are no roots\n"
  elsif delta > 0
    result_1 = (-b + Math.sqrt(delta)) / (2*a)
    result_2 = (-b - Math.sqrt(delta)) / (2*a)
    print "The first root is #{result_1}\n"
    print "The second root is #{result_2}\n"
  else
    result_1 = -b / (2*a)
    print "The root is #{result_1}\n"
  end
