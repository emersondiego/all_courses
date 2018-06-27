# tipos de variaveis (inteiro. float (real), string)
# Como receber dados e imprimir dados

puts 'Olá!'
puts 'Digite seu nome:'
name = gets.chomp   # Solicitada entrada de dados / lê algo
                    # metodo chomp retira quebra de linha
puts 'O seu nome é ' + name.inspect # imprimi dados
                    # .inspect inspeciona  e verifica o que tem dentro da variavel
puts 'Digite sua idade:'
age = gets.chomp
puts 'Sua idade é ' + age                 

=begin # inicia trecho do codigo a ser desconsiderado
=end # finaliza trecho do codigo a ser desconsiderado 