=begin
### Fatorial###

 n = 6
 res = n * (n-1) * (n-2) * (n-3) * (n-4) * (n-5) * 1
 puts "{n} = {res}"


res = 1

 cenario 1

 for n in 1..6 do
     res = n * res
     puts "{n} = +{res}"
 end

 cenario 2 
for n in (6).downto(1) do
    res = n * res
    puts "#{n} = +#{res}"
end
=end

### ATIVIDADES ###

=begin
Exercicio 1: Imprimir os números de 1 a 20 na tela
=end

i = 1
for i in 1..20 do
    puts "#{i}"
    i += 1 
end


#melhor solução - Nao precisa declarar o i

for i in 1..20 do
    puts "#{i}" 
end 

=begin
Exercicio 2: Imprimir somente os números pares, de 1 a 20 na tela.
Dica: Pode usar o resto da divisão por 2 ou um método em Ruby que ti diz se o número é par ;)
=end

for i in 1..20 do
    if i % 2 == 0  # checa se o número é par ou não através da função "resto".
        puts i
    end
end


#melhor solução - Nao precisa declarar o i
# for i in 1..20 do
#     if i.even
#     if i.odd
#         puts i
#     end
# end

#certa 

for i in 1..20 do
    puts i if i.even?
end


=begin
Exercicio 3:
Fazer um método que, ao digitarmos um número inteiro positivo maior que zero,
imprime na tela todos os números primos até o número digitado

5 - Fazer esse em metodo recursivo 
=end

n = gets.chomp.to_i

def is_prime?(number)
  for i in 2..number-1 do
    puts "#{number} % #{i} = #{number % i}"
    return false if number % i == 0
  end
  true
end

is_prime?(n)