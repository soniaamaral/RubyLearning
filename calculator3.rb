def is_triangle(a, b, c)
  a < (b + c) and b < (a + c) and c < (a + b)
end

begin
  print "Enter the first side of your triangle:"
  side_a=STDIN.gets.chomp.to_f

  print "Enter the second side of your triangle:"
  side_b=STDIN.gets.chomp.to_f

  print "Enter the third side of your triangle:"
  side_c=STDIN.gets.chomp.to_f

  print "This is not a valid triangle\n" unless is_triangle(side_a, side_b, side_c)

end until is_triangle(side_a, side_b, side_c)


semiperimeter = (side_a + side_b + side_c)/2

area = Math.sqrt(semiperimeter*(semiperimeter-side_a)*(semiperimeter-side_b)*(semiperimeter-side_c))
p area
