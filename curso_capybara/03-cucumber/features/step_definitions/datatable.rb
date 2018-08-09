# em linhas begin #

Dado("que eu tenho umas laranjas") do |table|
  @laranja = table.rows_hash['laranja'].to_i
end

Quando("corto {int} laranjas") do |valor1|
  @cortar = valor1
  @total = @laranja - @cortar
end

Então("verifico  quantas laranjas sobraram inteiras") do
  expect(@total).to eq 8
end

# em linhas end #

# em colunas begin #

Dado("eu que tenho umas laranjas") do |table|
  table.hashes.each do |valor|
    @laranjas = valor["laranja"].to_i
  end
end

Quando("chupo {int} laranjas") do |valor2|
  @chupei = valor2
  @resultado = @laranjas - @chupei
end

Então("verifico quantas laranjas sobraram") do
  expect(@resultado).to eq 8
end

# em colunas end #
