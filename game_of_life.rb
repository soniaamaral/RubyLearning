
current_grid = [
  [ 0, 0, 1 ],
  [ 0, 0, 0 ],
  [ 1, 1, 0 ] ]

def apply_rules(grid)
  grid
end

10.times do
  new_grid = apply_rules(current_grid)
  print "#{new_grid}\n"
  current_grid = new_grid
end
