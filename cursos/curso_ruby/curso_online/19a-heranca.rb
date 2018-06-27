class Funcionario
    attr_accessor :nome, :cpf, :salario
end

class Gerente < Funcionario
    attr_accessor :senha, :tempo_empresa 
end

puts "Funcionario"
puts "___________"
f = Funcionario.new
f.nome = "Emerson"
f.cpf = 00000000000
f.salario = 12.0

puts f.nome
puts f.cpf
puts f.salario


puts "=============="
 g = Gerente.new 
puts "Gerente"
puts "_______"
 g.nome = "Isa"
 g.cpf = 00000000001
 g.salario = 10.0
 g.senha = 1234
 g.tempo_empresa = 5

puts g.nome
puts g.cpf
puts g.salario
puts g.senha
puts g.tempo_empresa
 