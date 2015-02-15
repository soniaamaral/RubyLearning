def is_triangle(a, b, c)
  a < (b + c) and b < (a + c) and c < (a + b)
end

#Checking to see if it has three sides.  Will need to ask to count number in array sides
def has_3_sides (sides)
 sides.length==3
end

begin
  print "Enter the THREE sides of your triangle leaving a space between each:"
  sides=STDIN.gets.chomp.split.map { |s| s.to_f }
  side_a = sides[0]
  side_b = sides[1]
  side_c = sides[2]

  print "This is not a valid triangle\n" if not has_3_sides (sides) or not is_triangle(side_a, side_b, side_c)


end until has_3_sides (sides) and is_triangle(side_a, side_b, side_c)


semiperimeter = (side_a + side_b + side_c)/2

area = Math.sqrt(semiperimeter*(semiperimeter-side_a)*(semiperimeter-side_b)*(semiperimeter-side_c))
p area
