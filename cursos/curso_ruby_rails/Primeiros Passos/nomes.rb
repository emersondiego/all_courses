nomes = %w(Emerson Isadora Thiago Ernesto)

# interpolar
nomes.each do |nome|  
    puts "Olá, #{nome}"
end

puts "---------------"

# concatenar string / gsub

puts "Ruby " + "on " + "Rais " + nomes[0]

texto = "Ruby " << "on " << "Rais " << nomes[0]

puts texto.gsub!("Emerson", "O melhor curso!") # substitui o texto desejado

puts texto # nao substitui se nao colocar o "!" no gsub


puts "------------------"

txt = "Emerson Pereira"
puts txt.object_id
# concatenando "+" muda o objeto
txt = txt + ", Edap"
puts txt.object_id # altera o valor logico quando modifiquei o texto

#melhor usar isso ou interpolar
# concatenando "<<" nao muda o objeto
txt = txt << ", Diego" ## quando utiliza o << ele manter o valor logico
puts txt.object_id

puts "------------------"

# simbolos

# qualquer palavra que se inicia com ":" uma string imutavel ex. :teste
#Seguindo esse ex. h = {"a" => 123, "b" => 456}

# hashs e simbolos
h = { :a => 123, :b => 456 }

puts h

puts "------------------"

# a partir do ruby 1.9 / outra notação

ha = { a: 123, b: 456 }

puts ha



