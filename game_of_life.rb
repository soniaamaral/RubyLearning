
current_grid = [
  [ 0, 0, 0, 0, 0, 0 ],
  [ 0, 0, 0, 0, 0, 0 ],
  [ 0, 0, 1, 1, 1, 0 ],
  [ 0, 1, 1, 1, 0, 0 ],
  [ 0, 0, 0, 0, 0, 0 ],
  [ 0, 0, 0, 0, 0, 0 ]  ]

def count_live_neighbors x, y, grid
  counter = 0
  counter = counter + 1 if grid[y][x-1] == 1
  counter = counter + 1 if grid[y][x+1] == 1
  counter = counter + 1 if y > 0 && grid[y-1][x-1] == 1
  counter = counter + 1 if y > 0 && grid[y-1][x] == 1
  counter = counter + 1 if y > 0 && grid[y-1][x+1] == 1
  counter = counter + 1 if (y + 1) < grid.size && grid[y+1][x-1] == 1
  counter = counter + 1 if (y + 1) < grid.size && grid[y+1][x] == 1
  counter = counter + 1 if (y + 1) < grid.size && grid[y+1][x+1] == 1

  counter
end

def apply_rules(grid)
  new_grid = Array.new(grid.size) { [] }

  grid.each_index do |cell_coordinate_y|
    row = grid[cell_coordinate_y]
    row.each_index do |cell_coordinate_x|
      case count_live_neighbors(cell_coordinate_x, cell_coordinate_y, grid)
      when 0..1
        new_grid[cell_coordinate_y][cell_coordinate_x] = 0
      when 2
        new_grid[cell_coordinate_y][cell_coordinate_x] = grid[cell_coordinate_y][cell_coordinate_x]
      when 3
        new_grid[cell_coordinate_y][cell_coordinate_x] = 1
      else
        new_grid[cell_coordinate_y][cell_coordinate_x] = 0
      end
    end
  end
  new_grid
end

def print_grid(grid)
  grid.each do |row|
    row.each do |cell|
      print "@" if cell==1
      print "." if cell==0
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
