Dado("eu tenha {int} laranjas.") do |valor1|
  puts "Tenho #{valor1}"
  @laranjas = valor1
end

Quando("eu como {int} laranjas.") do |valor2|
  puts "Comi #{valor2}"
  @comer = valor2
  @resultados = @laranjas - @comer
end

Então("eu vejo quantas laranjas sobraram.") do
  puts "Ainda tenho #{@resultados}"
  expect(@resultados).to eq(8)
end

Quando("eu compro {int} laranjas.") do |valor3|
  puts "Tenho #{valor3}"
  @comprar = valor3
  @compra_total = @laranjas + @comprar
  
end

Então("eu vejo quantas laranjas tenho.") do
  expect(@compra_total).to eq (15)
  puts "Comprei ao todo #{@compra_total} laranjas"
end