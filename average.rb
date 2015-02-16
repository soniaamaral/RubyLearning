#def average (a, b, c)
#  (a+b+c)/3
#end

def average (sides)
  sides.reduce {|a,b| a+b}/sides.count
end

print "Enter your numbers:"
sides=STDIN.gets.chomp.split.map { |s| s.to_f }

p average(sides)
