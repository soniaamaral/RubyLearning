def is_triangle(a, b, c)
  a < (b + c) and b < (a + c) and c < (a + b)
end

#Checking to see if it has three sides.  Will need to ask to count number in array sides
def has_3_sides(x)
 x.length==3
end

#Validation function.  Should check that two things are true, if not print error message

def triangle_validation (sides, a, b, c) #unsure about stuff in parens here, if need etc
  #if is_triangle(a, b, c) then True elseif print "This is not a valid triangle" end
  #if has_3_sides(sides) then True elseif print "You must enter THREE sides" end

  if has_3_sides(sides) and is_triangle(a, b, c)
    return true
  elsif not has_3_sides(sides)
    print "You must enter THREE sides\n"
    return false
  elsif not is_triangle(a, b, c)
    print "This is not a valid triangle\n"
    return false
  end
  #if not is_triangle(a, b, c) then return False and print "This is not a valid triangle" end
  #if not has_3_sides(sides) then return False and print "You must enter THREE sides"  end
  # return True if is_triangle(a, b, c) and has_3_sides(sides)
  #return False if is not has_3_sides(sides)
  #if False print "You must enter THREE sides"
end




#could do while triangle_validation = True it calculates, when not, it asks again
begin
  print "Enter the THREE sides of your triangle leaving a space between each:"
  sides=STDIN.gets.chomp.split.map { |s| s.to_f }
  side_a = sides[0]
  side_b = sides[1]
  side_c = sides[2]

end until triangle_validation(sides, side_a, side_b, side_c) #return True

semiperimeter = (side_a + side_b + side_c)/2

area = Math.sqrt(semiperimeter*(semiperimeter-side_a)*(semiperimeter-side_b)*(semiperimeter-side_c))
p area
