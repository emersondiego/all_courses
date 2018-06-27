class Teste
    def ola  # metodo de instancia # neste cenario tenho que ter uma instancia da classe pra utilizar o metodo
        "Olá"
    end

    def self.hello # metodo de classe # nao é necessario instanciar a classe
        "Hello"
    end
end


#### exemplo def ola
t = Teste.new # nesse caso é necessario instanciar o obj
puts t.ola

puts "==============="

### exemplo de self.hello
puts Teste.hello # não é necessario criar um objeto