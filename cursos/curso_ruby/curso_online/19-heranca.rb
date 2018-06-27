class Pai
    attr_accessor :nome
    def falar(texto = "Ola")
        texto
    end
end

class Filha < Pai

end

p = Pai.new
p.nome = "Emerson"
puts p.nome
puts p.falar

puts "================================="

f = Filha.new
f.nome = "Isadora"
puts f.nome
puts f.falar("Hello")