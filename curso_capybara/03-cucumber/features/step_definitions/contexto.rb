Dado("que eu tenho {int} laranjas na bolsa") do |valor|
  @laranjas = valor
end

Quando("eu coloco {int} laranjas na bolsa.") do |valor2|
  @coloquei = valor2
  @resultado = @laranjas + @coloquei
end

Então("verifico o total de laranjas é {int}.") do |total|
  expect(@resultado).to eq total
end

Quando("tiro {int} laranjas da bolsa") do |valor3|
  @retirei = valor3
  @resultado = @laranjas - @retirei
end

Então("vejo quantas laranjas fiquei na bolsa") do
  expect(@resultado).to eq 8
end