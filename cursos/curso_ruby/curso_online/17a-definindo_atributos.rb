# Outro modo no Ruby

class Pessoa # declarar classe
    @nome = nil
    @idade = nil

    def nome=(nome) # dessa forma em guarda 
        @nome = nome
    end

    def nome # desse maneira eu pego
        @nome
    end

    def idade=(idade) # guarda idade
        @idade = idade
    end

    def idade # mostro idade
        @idade
    end
end

#######################

# duas instancias com dois objetivos guardando os valores nesses objetos e sem seguida iremos mostrar eles
pessoa1 = Pessoa.new
pessoa1.nome = "Emerson Pereira"
pessoa.idade = 30

pessoa2 = Pessoa.new
pessoa2.nome = "Thiago Pereira"
pessoa2.idade = 33

puts pessoa1.nome   
puts pessoa1.idade

puts pessoa2.nome    
puts pessoa2.idade