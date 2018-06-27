class Pessoa
    attr_accessor :nome

    def initialize(str)
        @nome = str
    end

    # def nome
    #     @nome
    # end

    # def nome=(novo_nome)
    #     @nome = novo_nome
    # end

    def apresente_se 
        puts "Ola, eu nasci da classe pessoa!"
    end

    def qual_o_seu_numero?
        puts self.object_id
    end
end

=begin
[8] pry(main)> require_relative "pessoa"
=> true
[9] pry(main)> x = Pessoa.new
=> #<Pessoa:0x00000000b40b68>
[10] pry(main)> x.apresente_se
Ola, eu nasci da classe pessoa!
=> nil
[11] pry(main)> y = Pessoa.new
=> #<Pessoa:0x000000014e3198>
[12] pry(main)> x
=> #<Pessoa:0x00000000b40b68>
[13] pry(main)> y
=> #<Pessoa:0x000000014e3198>
[14] pry(main)> x.object_id
=> 5899700
[15] pry(main)> y.object_id
=> 10950860
[16] pry(main)> exit
=end

=begin
─emerson@emerson-ote ~/workspace/trainne/cursos/curso_ruby_rails ‹ruby-2.4.0› ‹master*› 
╰─➤  pry
[1] pry(main)> require_relative "pessoa"
=> true
[2] pry(main)> x = Pessoa.new
=> #<Pessoa:0x00000001b7a9c0>
[3] pry(main)> x.apresente_se
Ola, eu nasci da classe pessoa!
=> nil
[4] pry(main)> x.qual_o_seu_numero
NoMethodError: undefined method `qual_o_seu_numero' for #<Pessoa:0x00000001b7a9c0>
Did you mean?  qual_o_seu_numero?
from (pry):4:in `__pry__'
[5] pry(main)> x.qual_o_seu_numero?
14406880
=> nil
[6] pry(main)> y = Pessoa.new
=> #<Pessoa:0x00000001a14680>
[7] pry(main)> y.apresente_se
Ola, eu nasci da classe pessoa!
=> nil
[8] pry(main)> y.qual_o_seu_numero?
13673280
=> nil
[9] pry(main)> x.qual_o_seu_numero?
14406880
=> nil

[1] pry(main)> require_relative "pessoa"
=> true
[2] pry(main)> x = Pessoa.new("Emerson")
=> #<Pessoa:0x00000002abdb58 @nome="Emerson">
[3] pry(main)> x.imprimir_nome
Emerson
=> nil
[4] pry(main)> x.guardar_nome("Diego")
NoMethodError: undefined method `guardar_nome' for #<Pessoa:0x00000002abdb58 @nome="Emerson">
Did you mean?  guardar_name
from (pry):4:in `__pry__'
[5] pry(main)> x.guardar_name("Diego")
=> "Diego"
[6] pry(main)> x.imprimir_nome
Diego
=> nil

[2] pry(main)> require_relative "pessoa"
=> true
[3] pry(main)> x = Pessoa.new("Emerson")
=> #<Pessoa:0x00000001b31518 @nome="Emerson">
[4] pry(main)> x.nome=("Diego")
=> "Diego"
[5] pry(main)> x.nome="Diego"
=> "Diego"
[6] pry(main)> x.nome ="Diego"
=> "Diego"
[7] pry(main)> x.nome
=> "Diego"
[8] pry(main)> 

[2] pry(main)> require_relative "pessoa"
=> true
[3] pry(main)> x = Pessoa.new("Jose")
=> #<Pessoa:0x00000002225748 @nome="Jose">
[4] pry(main)> x.nome
=> "Jose"
[5] pry(main)> x.nome = Joca
NameError: uninitialized constant Joca
from (pry):5:in `__pry__'
[6] pry(main)> x.nome = "Joca"
=> "Joca"
[7] pry(main)> x.nome
=> "Joca"
[8] pry(main)> 


=end