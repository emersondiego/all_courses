#Condicionais - if, unless, case

a = 3 

b = 5 

if a < b
    puts "a é menor"
else
    puts "a é maior"
end

puts "------------------"


unless a < b #  a menos que...
    puts "b é menor"
else
    puts "a é menor"
end

puts "------------------"

case a
when 3 
    puts "é três"
when 4
    puts "é quatro"
end

puts "------------------"

# Condição Ternario

(a == 3 ) ? (puts "é igual a tres") : (puts "é diferente")

# equivalente a isso abaixo:

if a == 3 
    puts "é igual a tres" 
else    
   puts "é diferente"
end

puts "------------------"

puts 1 + 2
puts 5 - 3
puts 2 * 2
puts 4 / 4
puts 2 ** 3
puts 5 % 2

puts "------------------"

while a < 10 # enquanto
    a += 1
    puts a
end

puts "------------------"

until a == 0 # até
    a -= 1
    puts a
end

puts "------------------"

for i in 0..5
    puts i
end

puts "------------------"


[1,2,3,4].each do |j| #cada
    puts j
end