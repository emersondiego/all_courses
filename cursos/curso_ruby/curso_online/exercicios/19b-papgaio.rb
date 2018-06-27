#### Exercicio 1 - Emerson (Acertei)

class Papagaio
    attr_accessor :nome
    attr_accessor :idade

    def initialize(nome, idade)
        @nome = nome
        @idade = idade
    end

    def repetir_frase(palavra = "curupaco!!")
        palavra
    end
end

papagaio1 = Papagaio.new("Emerson", 30)
puts papagaio1.nome
puts papagaio1.idade
puts papagaio1.repetir_frase

puts "----------------------------"

papagaio2 = Papagaio.new("Isaaa", 27)
puts papagaio2.nome
puts papagaio2.idade
puts papagaio2.repetir_frase("Eita trem bom!")
