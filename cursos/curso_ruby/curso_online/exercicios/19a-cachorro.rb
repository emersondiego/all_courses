=begin

Exercicio 1 - Emerson

Obs: Esquece de olhar com calma a descrição do exercicio 
    e ver que pedia para que a raça nao fosse alterada

=end

# class Cachorro
#     attr_accessor :nome
#     attr_accessor :raca
#     def initialize(nome, raca)
#         @nome = nome
#         @raca = raca
#     end

#     def latir(late = "au au au")
#         puts late
#     end
# end

# cachorro1 = Cachorro.new("Baggio","Hask")
# cachorro2 = Cachorro.new("Safira","Vira-Lata")

# puts cachorro1.nome
# puts cachorro1.raca
# puts cachorro2.nome
# puts cachorro2.raca

# cachorro1.latir("Auuuuuuuuuuuuuuuuuuuuuuuu")
# cachorro2.latir


#### Exercicio 1 - Professor

class Cachorro
    attr_accessor :nome
    attr_reader :raca # nao consegue alterar / só le e com isso nao permite modificar

    def initialize(nome, raca)
        @nome = nome
        @raca = raca
    end

    def latir(latido = "au au!")
        latido
    end
end

cachorro1 = Cachorro.new("ToTo","Pit Bull")
puts cachorro1.nome

puts cachorro1.raca
# cachorro1.raca = "testes" # testes para ver se nao altera valor da raca
# puts cachorro1.raca
puts cachorro1.latir

puts "----------------------------"

cachorro2 = Cachorro.new("Isa","Pooldo")
puts cachorro2.nome
puts cachorro2.raca
puts cachorro2.latir("Auuuuuuuuuuuuuuu!")


