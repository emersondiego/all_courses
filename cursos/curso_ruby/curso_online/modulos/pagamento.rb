module Pagamento
    PI = 3.14
    def pagar(bandeira, numero, valor)
        "Pagando com o cartao de credito, numero #{numero} #{bandeira} no valor de R$#{valor}"
    end  

    class Visa
        def pagando
            "Pagando..."
        end
    end
end