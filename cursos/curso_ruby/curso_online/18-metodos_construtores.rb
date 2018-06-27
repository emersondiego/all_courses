=begin
Metodos inicializadores
permitem inicializar o objeto com dados padrao
metodo utilizado "initialize"
é invogado quando inicia um novo objeto

=end

class Pessoa
    attr_accessor :nome 
    attr_accessor :idade

    ## Exemplo 1 
    # def initialize
    #     @nome = "Fulano!" # inialmente o nome da pessoa é fulano e idade 0, ate que eu subscreve este dado iniciado, 
    #     # mas o ideial é que seja preenchido os campos
    #     @idade = 0        
    # end

    ## Exemplo 2
    def initialize(nome, idade)
        @nome = nome
        @idade = idade
    end


    def gritar(texto = "Grrrrrrr") #declarar metodos
        texto # retorno do metodo
    end

    def agradecer(texto = "Obrigado")
        return texto 
    end
end

#######################
# exemplo 1 
# pessoa1 = Pessoa.new
# # pessoa1.nome = "Emerson Pereira"
# pessoa1.idade = 30

# pessoa2 = Pessoa.new
# pessoa2.nome = "Thiago Pereira"
# # pessoa2.idade = 33


# Exemplo 2
pessoa1 = Pessoa.new("Emerson Diego", 30)
pessoa2 = Pessoa.new("Ernesto Lopes", 60)



#####

puts pessoa1.nome   
puts pessoa1.idade

puts pessoa2.nome    
puts pessoa2.idade
