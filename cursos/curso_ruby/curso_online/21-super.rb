class Franquia
    def descricao
        "Franquia!"
    end
end
class Franquiado < Franquia
    def descricao
        puts super # ele entende que quero saber a class superior (pai) primeiro e depois roda o metodo seguinte
        "Franquiado!!"
    end
end

f = Franquia.new
puts f.descricao
puts "========================"
ff = Franquiado.new
puts ff.descricao

##########################

class Conta
    attr_reader :numero, :saldo

    def initialize(numero, saldo = 0)
        @numero = numero
        @saldo = saldo
    end
end

class ContaEspecial < Conta
    attr_reader :limite_especial
    def initialize(numero, saldo,limite_especial)
        super(numero, saldo) # exemplo do super, pegando alguns parametros informados chamos a classe pai
        @limite_especial = limite_especial
    end
end

puts "================="
c = Conta.new("001",100.00)
puts c.numero
puts c.saldo

puts "=================="

ce = ContaEspecial.new("002", 200.00, 1500.00)
puts ce.numero
puts ce.saldo
puts ce.limite_especial