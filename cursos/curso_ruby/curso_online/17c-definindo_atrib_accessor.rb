# Outro modo no Ruby - ATTR_READER
=begin 
 attr_writer :nome - guardar informacao
 attr_reader :nome - le a informação
 attr_accessor - Guarda e le a informaçao

=end

class Pessoa

    attr_reader :nome # Apenas le o nome, não guarda a informação
    attr_accessor :idade


    # def nome=(nome)   # guarda nome / mas nesse caso o attr_reader não gera esse metodo
                        # Caso quisesse usar apenas esse metodo usaria o "attr_writer" e o de mostrar o nome nao iria ser apresentado
    #     @nome = nome
    # end

    # def nome #para attr_writer esse metodo nao iria ser apresentado, caso queria usar ele devo usar attr_reader
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