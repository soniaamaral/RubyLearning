
current_grid = [
  [ 0, 0, 1, 1 ],
  [ 0, 0, 0, 0 ],
  [ 1, 1, 0, 0 ],
  [ 1, 1, 0, 0 ],
  [ 1, 1, 0, 0 ] ]

def apply_rules(grid)
  grid
end

def print_grid(grid)
  grid.each do |row|
    row.each do |element|
      print "@" if element==1
      print "." if element==0
    end
    print "\n"
  end
  print "\n"
end

10.times do
  new_grid = apply_rules(current_grid)
  print_grid(new_grid)
  current_grid = new_grid
end
