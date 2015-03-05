#!/usr/bin/ruby

def fibonacci(n)
  return 1 if n == 0 or n == 1
  starting_array = [1, 1]
  (n-1).times do
    new_number = starting_array[-1] + starting_array[-2]
    starting_array<<new_number
  end
  return starting_array[-1]
end

16.times do |x|
  print "fibonacci(#{x}) = #{fibonacci(x)}\n"
end
