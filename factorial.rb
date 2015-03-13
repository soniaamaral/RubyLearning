def factorial n
  return 1 if n == 0
  (1..n).reduce {|a,b| a*b}
end

36.times do |x|
  print "factorial(#{x}) = #{factorial(x)}\n"
end
