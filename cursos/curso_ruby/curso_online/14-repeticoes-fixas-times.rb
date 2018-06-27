=begin
Repetições fixas com 'times'

ex. x.times

=end

╰─➤  irb
2.4.0 :001 > 10.times { puts "Emerson" }
Emerson
Emerson
Emerson
Emerson
Emerson
Emerson
Emerson
Emerson
Emerson
Emerson
 => 10 
2.4.0 :002 > 10.times { |x| puts "#{x} - Emerson" }
0 - Emerson
1 - Emerson
2 - Emerson
3 - Emerson
4 - Emerson
5 - Emerson
6 - Emerson
7 - Emerson
8 - Emerson
9 - Emerson
 => 10 
