# Overriding, pegar o mesmo metodo da herança mas alterar para que o metodo filho tenha sua particularidade
class Calculadora
    def somar(n1,n2)
        n1 + n2 
    end
end

class CalculadoraFashion < Calculadora
    def somar(n1, n2) #subscrevendo o metodo da classe pai
        "A soma é #{n1 + n2}"
    end
end

#######
c = Calculadora.new
puts c.somar(5,8)

cf = CalculadoraFashion.new
puts cf.somar(5,8)