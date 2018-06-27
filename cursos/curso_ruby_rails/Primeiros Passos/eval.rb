puts "Digite o que quer fazer:"

str = gets.chomp

puts str.inspect
puts str.class 
    
x = eval(str) # interpretada como codigo Ruby, mudando de string para inteiro 

puts x