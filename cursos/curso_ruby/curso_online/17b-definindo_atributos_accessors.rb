# Outro modo no Ruby - ATTR_ACCESSOR

class Pessoa # declarar classe
    attr_accessor :nome # Esse attr_accessor é equivalente a fazer todos esse metodos abaixo (nome e idadde)
    attr_accessor :idade # fica muito mais elegante e econimiza codigo


    # def nome=(nome) # dessa forma em guarda 
    #     @nome = nome
    # end

    # def nome # desse maneira eu pego
    #     @nome
    # end

    # def idade=(idade) # guarda idade
    #     @idade = idade
    # end

    # def idade # mostro idade
    #     @idade
    # end
end

#######################

# duas instancias com dois objetivos guardando os valores nesses objetos e sem seguida iremos mostrar eles
pessoa1 = Pessoa.new
pessoa1.nome = "Emerson Pereira"
pessoa1.idade = 30

pessoa2 = Pessoa.new
pessoa2.nome = "Thiago Pereira"
pessoa2.idade = 33

puts pessoa1.nome   
puts pessoa1.idade

puts pessoa2.nome    
puts pessoa2.idade