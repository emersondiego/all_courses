=begin
Estrutas condionais 
    IF.. ELSIF ... ELSE
    UNLESS
    CASE ... WHEN
=end

puts "Escolha um numero entre 1 e 5:"
number = gets.chomp.to_i


#cenario1 Condicional SE / IF
=begin
if number > 10 then # usa o then para ficar bonita a escrita
        puts "O valor digitado é maior que 10."
    else
        puts "O valor digitado é menor ou igual a 10."
    end
=end

#cenario2

    if number > 10 then # usa o then para ficar bonita a escrita
        puts "O valor digitado é maior que 10."
    elsif number >= 5 then 
        puts "O valor é maior ou igual a 5. " # entre 5 e 10
    else
        puts "O valor digitado é menor 5."
    end
  

#cenario3 UNLESS a menos / ele faz o contrario do if, em alguns casos é interessante utiliza-lo
=begin
    unless number > 10
        puts "O numero digitado é menor que 10"
    else 
        puts "o numero digitado é maior que 10"
    end
=end

#cenario3 CASE
=begin
case number     
    when 1
        puts "Você escolheu opção 1"
    when 2
        puts "Você escolheu opção 2"
    when 3
        puts "Você escolheu opção 3"
    when 4
        puts "Você escolheu opção 4"
    when 5
        puts "Você escolheu opção 5"
    else 
        puts "O numero informado não foi encontrado na lista!"
end
=end