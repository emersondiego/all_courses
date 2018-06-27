require_relative 'pagamento'

include Pagamento # a partir de agora voce deve incluir no conteudo que vamos trabalhar o modulo que foi passado # modulo sempre usado com INCLUDE

p = Visa.new #1 trabalhando com classes 
puts p.pagando

puts PI #2 trabalhando Constantes

puts "Digite a bandeira do cartão:"
b = gets.chomp

puts "Digite o numero do cartão:"
    n = gets.chomp
    
puts "Digite o valor da compra:"
    v = gets.chomp    


puts Pagamento.pagar(b,n,v) 

# ou simplesmente
puts pagar(b,n,v)  #3 trabalhando com Metodos

