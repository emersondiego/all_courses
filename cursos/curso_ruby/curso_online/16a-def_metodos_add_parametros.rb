class Pessoa
    def gritar(texto) # quero passar algo proprio via parametro passando algo para o metodo
        puts texto
        # ou interolando
        puts ("Gritando #{texto}")
    end

    def agradecer(texto2)
        puts texto2
    end

    def correr(texto3 = "Valor default") # caso nao seja passado nada no objeto ele considera o valor que valor no parametro
        puts texto3
    end

end

obj1 = Pessoa.new   
obj1.gritar("Se fudeuuuu")
obj1.agradecer("Eaee porra")
obj1.correr # exemplo texto3, sem passar parametro
obj1.correr("Rapido") # exemplo texto3, passando parametro