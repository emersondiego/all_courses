require_relative 'pessoa.rb'

class PessoaJuridica < Pessoa
    attr_accessor :cnpf
    attr_accessor :nome_fantasia
end


=begin
 ╭─emerson@emerson-ote ~/workspace/trainne/cursos/curso_ruby_rails/heranca ‹ruby-2.4.0› ‹master*› 
╰─➤  pry 
[1] pry(main)> require_relative "pessoa_f"
=> true
[2] pry(main)> require_relative "pessoa_j"
=> true
[3] pry(main)> pf = PessoaFisica.new
=> #<PessoaFisica:0x00000002303818>
[4] pry(main)> pj = PessoaJuridica.new
=> #<PessoaJuridica:0x000000022a02b8>
[5] pry(main)> pf.nome("Emerson")
ArgumentError: wrong number of arguments (given 1, expected 0)
from (pry):5:in `__pry__'
[6] pry(main)> pf.nome ="Emerson"
=> "Emerson"
[7] pry(main)> pf.endereco ="Rua xyz"
=> "Rua xyz"
[8] pry(main)> pj.nome ="Tacos Bobos"
=> "Tacos Bobos"
[9] pry(main)> pj.endereco ="Rua sem numero"
=> "Rua sem numero"
[10] pry(main)> pf.cpf = "1236485"
=> "1236485"
[14] pry(main)> pj.nome_fantasia = "abcd"
=> "abcd"
[15] pry(main)> pf.class
=> PessoaFisica
[16] pry(main)> pf.class
=> PessoaFisica
[17] pry(main)> 
   

=end