=begin
Incluir puts puts

def media_calc(notas)
  soma = 0
  notas.each do |nota|
    soma += nota.to_i
  end
  puts "#{soma} / #{notas.size} = #{soma / notas.size}"
  soma / notas.size
end

aprovacao = 5

prova1 = gets.chomp
prova2 = gets.chomp

notas = [ prova1, prova2 ]

while(media_calc(notas) < aprovacao)
  trabalho = gets.chomp
  notas << trabalho
end


```Exercicio 4: Melhorar o código acima```
=end
