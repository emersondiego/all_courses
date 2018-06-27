=begin
Neste exemplo esta acontecendo um pseudo Herança Multiplas

entre os aquivos

a.rb
b.rb
exemplo.rb

Executando no arquivo app1.rb
=end


require_relative 'exemplo'

x = Exemplo.new

# modulo A
x.a1
x.a2

# modulo B
x.b1
x.b2

# classe Exemplo
x.ex1