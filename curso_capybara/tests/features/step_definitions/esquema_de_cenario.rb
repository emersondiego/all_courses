Quando("multiplico minhas {int} pelo {int}") do |laranjas, valor|
  @multiplicacao = laranjas * valor
end

Então("vejo qual é o {int} da multiplicação.") do |resultado|
  expect(@multiplicacao).to eq resultado
end