str = "Pão,Leite,Café,Bolacha"
puts str

x = str.split(",") #cria um array , separei por virgura, mas poderia ser qq outra coisa

puts x.inspect

puts "---------------------"


str1 = "Emerson Pereira"

puts str1

x = str1.split # separa por espaço sem passar nada

puts x.inspect

puts "---------------------"

str2 = %w(Emerson Diego)
puts str2.inspect

puts "---------------------"

puts "Isso é um Join! #{str2.join}" # juntas as coisas novamente

puts "Isso é um Join! #{str2.join(" ")}" # mas quero inserir espaço ou outra coisa

