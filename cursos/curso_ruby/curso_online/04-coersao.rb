# puts "Digite sua idade:"
# age = gets.chomp
# age2 = age + 1 #age passa como string por isso da erro ao imprimir na tela abaixa é preciso converter
# puts "Sua idade ano que vem será: #{age2}" #aqui é apresentado erro

=begin
mais usadas:
.to_i para inteiro
.to_f para float/real
.to_s para string    

exemplos:
entender qual o tipo de conversao, pois se usava errada pode gerar um falso positivo
Veja: 
age2 = age + 1.to_s - ira apenas juntar as informaçoes exemplo entre com 30 
ira ser apresentado 301
=end

#correto 1
# puts "Digite sua idade:"
# age = gets.chomp
# age2 = age.to_i + 1 # necessario converter/coerção string em inteiro dessa forma irá conseguir somar os valores
# puts "Sua idade ano que vem será: #{age2}"

#correto 2
puts "Digite sua idade:"
age = gets.chomp.to_i # posso fazer tbm de forma encadeada atraves do "."varios metodos, pois o ruby permite isso 
age2 = age + 1 
puts "Sua idade ano que vem será: #{age2}"