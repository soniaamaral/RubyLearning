def swap_right_adjascent elements, index
  y = elements[index]
  elements[index] = elements[index + 1]
  elements[index + 1] = y
end

a = [ 9, 8, 3, 5, 11, 7, -3 ]

p a

# swap_right_adjascent a, 0 if a[0] > a[1]
# swap_right_adjascent a, 1 if a[1] > a[2]
# swap_right_adjascent a, 2 if a[2] > a[3]
# swap_right_adjascent a, 3 if a[3] > a[4]
# swap_right_adjascent a, 4 if a[4] > a[5]


#y = a[0]
# a[0] = a[1]
# a[1] = y
#
# p a
#
# y = a[4]
# a[4] = a[5]
# a[5] = y
#
# p ap a

(a.length-1).times do |t|
  (0...a.length-1-t).each do |n|
    swap_right_adjascent a, n if a[n] > a[n+1]
  end
end

p a

5.times { |i| p i}
