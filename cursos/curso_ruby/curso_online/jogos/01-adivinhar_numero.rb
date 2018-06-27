
class AdivinharNumero
  attr_reader :numero
  attr_reader :venceu

  
  def initialize
    @numero = 5 # ao inves de usar numero fixo podemos informar numero randomicos atraves do Random.rand
    @numero = Random.rand(10)
    @venceu = false
  end
  def tentar_adivinhar(numero = 0)
    if numero == @numero
      @venceu = true
      return "Você VENCEU!"
    elsif numero > @numero
      return "Numero informado é muito alto..."
    else
      return "Numero informado é muito baixo..."
    end
  end
end

jogo = AdivinharNumero.new

until jogo.venceu do #enquanto for falso ira fazer o looping - a menos que o jogo tenha sido vencido não ira passar mais pelo until
  puts "Digite um numero"
  numero = gets.to_i 
  puts jogo.tentar_adivinhar(numero)
end