=begin
Operadores Logicos
&& ou and: e
|| OR: OU
!: Negação
    
=end

number1 = 25
number2 = 44
number3 = 2
number4 = 7


#cenario1 - AND -  pode ser usado o && ou and
=begin
if (number1 < number2) && (number3 < number4) 
    puts "Condição atendida para os dois casos (AND)"
else 
    puts "Condição NÃO atendida para os dois casos (AND)"
end
=end

#cenario2 - OU = OR || 
=begin
if (number1 > number2) || (number3 > number4)
    puts "Pelo menos uma condição atendida para os dois casos (OR)"
else 
    puts "Nenhuma condição atendida nos dois casos (OR)"
end
=end

#cenario3 - Negação: Not !  Inverte o valor que voce tem no momento.
if !(number3 > number4) 
    puts "Negação atendida"
else 
    puts "Negação NÃO atendida"
end