# @variavel = variavel de instancia


# Primeiro modo - metodos + variaveis de instancia para controlar atributos

class Pessoa # declarar classe
    @nome = nil
    @idade = nil

    def guardar_nome(nome)
        @nome = nome
    end

    def mostrar_nome
        @nome
    end

    def guardar_idade(idade)
        @idade = idade
    end

    def mostrar_idade
        @idade
    end

    def gritar(texto = "Grrrrrrr") #declarar metodos
        texto # retorno do metodo
    end

    def agradecer(texto = "Obrigado")
        return texto ## posso passar return no metodo caso eu queria, mas no ruby nao precisa. Declarando o return ajuda apenas no entendimento do codigo
    end
end

#######################

# duas instancias com dois objetivos guardando os valores nesses objetos e sem seguida iremos mostrar eles
pessoa1 = Pessoa.new
pessoa1.guardar_nome("Emerson Pereira")
pessoa1.guardar_idade(30)

pessoa2 = Pessoa.new
pessoa2.guardar_nome("Thiago Pereira")
pessoa2.guardar_idade(33)

puts pessoa1.mostrar_nome   
puts pessoa1.mostrar_idade

puts pessoa2.mostrar_nome    
puts pessoa2.mostrar_idade