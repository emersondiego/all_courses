class Conta
    ###corpoClasse
end

# deve iniciar o nome da classe com letra maiuscula 
# Commom Case caso seja dus palavras exemplo ContaCojunto


╰─➤  irb
2.4.0 :001 > require_relative "15-definindo_classes"
 => true 
2.4.0 :002 > obj1 = Conta.new
 => #<Conta:0x00000001e7ec20>   # gerado uma instancia / objeto no obj1
2.4.0 :003 > obj1
 => #<Conta:0x00000001e7ec20> 
2.4.0 :004 > obj1.class         # a classe Conta virou uma instancia de obj1
 => Conta 
2.4.0 :005 > 
