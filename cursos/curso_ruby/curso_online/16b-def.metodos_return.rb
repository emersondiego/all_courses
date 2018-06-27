class Pessoa # declarar classe
    def gritar(texto = "Grrrrrrr") #declarar metodos
        texto # retorno do metodo
    end

    def agradecer(texto = "Obrigado")
        return texto ## posso passar return no metodo caso eu queria, mas no ruby nao precisa. Declarando o return ajuda apenas no entendimento do codigo
    end
end

obj1 = Pessoa.new
puts obj1.gritar("Sao Pauloooooo")
# ou
result = obj1.agradecer
puts result