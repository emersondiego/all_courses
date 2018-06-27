require_relative 'lib/adivinhar_numero'

jogo = AdivinharNumero.new

until jogo.venceu do #enquanto for falso ira fazer o looping - a menos que o jogo tenha sido vencido não ira passar mais pelo until
  puts "Digite um numero"
  numero = gets.to_i 
  puts jogo.tentar_adivinhar(numero)
end