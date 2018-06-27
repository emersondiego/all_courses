=begin
each = cada

[12,53,89].each #coleção / hash / array

=end


2.4.0 :001 > a = [1,4,6,8,10]
 => [1, 4, 6, 8, 10] 
2.4.0 :002 > a
 => [1, 4, 6, 8, 10] 
2.4.0 :003 > a.each { |element| puts element }
1
4
6
8
10
 => [1, 4, 6, 8, 10] 

# posso fazer esse script de duas maneiras, tudo numa linha ou utilizando o "do"


 2.4.0 :009 > a.each do |element|
    2.4.0 :010 >    puts element
    2.4.0 :011?>    puts element * 2
    2.4.0 :012?>    puts element * 3
    2.4.0 :013?>   end
    1
    2
    3
    4
    8
    12
    6
    12
    18
    8
    16
    24
    10
    20
    30
     => [1, 4, 6, 8, 10]
    