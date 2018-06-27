v = [5,8,89,4] #array
puts v.class
puts v.inspect
puts v
puts v[2]

puts "------------------"

a = Array.new

a.push(10)
puts a.inspect

=begin
 ╰─➤  pry
[1] pry(main)> b = Array.new
=> []
[2] pry(main)> b.push(9)
=> [9]
[3] pry(main)> b.push(49)
=> [9, 49]
[4] pry(main)> b.push(6)
=> [9, 49, 6]
[5] pry(main)> b.push("Emerson")
=> [9, 49, 6, "Emerson"]
[6] pry(main)> b.push(true)
=> [9, 49, 6, "Emerson", true]
[7] pry(main)> b.class)
SyntaxError: unexpected ')', expecting end-of-input
b.class)
        ^
[7] pry(main)> b.class
=> Array
[8] pry(main)> 
=end