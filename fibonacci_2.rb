#!/usr/bin/ruby

def fibonacci(n)
  return 1 if n == 0 or n == 1
  fibonacci(n-1) + fibonacci(n-2)
end

36.times do |x|
  print "fibonacci(#{x}) = #{fibonacci(x)}\n"
end
