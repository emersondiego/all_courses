Dado("o endereço da API para manter o cadastro de Startup") do
  # $uri_base = "http://5b49f9b0ff11b100149bf42b.mockapi.io/cm/startup"
end

Quando("realizar uma requisição para cadastrar uma startup") do
  # $response = HTTParty.post($uri_base, :body => {"nome": @nome, "cidade": @cidade}) # variaveis nome e cidade incluida no arquivo startup_hook.rb
  $response = @startup.post_startup # usando padroa de pages
end

Então("a API irá retornar os dados do cadastro da Startup respondendo o código {int}") do |int|
  #expect do status code e message
  expect($response.code).to eq(int)
  puts "Response Code #{$response.code}"
  expect($response.message).to eq "Created"
  puts "Response Message #{$response.message}"

  #imprime os atributos da requisição

  puts "ID    : #{$response["id"]}"
  puts "Data  : #{$response["data"]}"
  puts "Nome  : #{$response["nome"]}"
  puts "Conta : #{$response["conta"]}"
  puts "Cidade: #{$response["cidade"]}"

  $id = $response["id"]
  puts "O id é: #{$id}"

end

Quando("realizar uma requisição passando o ID da startup") do
  $get = @startup.get_startup($id)
end

Então("a API irá retornar os dados da Startup correspondente respondendo o código {int}") do |int|
  expect($get.code).to eq(int)
  expect($get.message).to eq("OK")
  expect($get["id"]).to eq($response["id"])

  puts "ID    : #{$get["id"]}"
  puts "Data  : #{$get["data"]}"
  puts "Nome  : #{$get["nome"]}"
  puts "Conta : #{$get["conta"]}"
  puts "Cidade: #{$get["cidade"]}"
  puts "Status Code: #{$get.code}"
end

Quando("realizar uma requisição para alterar uma startup") do
  $put = @startup.put_startup($get["id"])
end

Então("a API irá retornar os dados da Startup alterados respondendo o código {int}") do |int|
  expect($put.code).to eq(int)
  expect($put.message).to eq("OK")
  expect($put["id"]).to eq($response["id"])

  puts "ID    : #{$put["id"]}"
  puts "Data  : #{$put["data"]}"
  puts "Nome  : #{$put["nome"]}"
  puts "Conta : #{$put["conta"]}"
  puts "Cidade: #{$put["cidade"]}"
  puts "Status Code: #{$put.code}"
end

Quando("realizar uma requisição para excluir uma startup") do
  $delete = @startup.delete_startup($put["id"])
end

Então("a API deverá retornar os dados da exclusão respondendo o código {int}") do |int|
  expect($delete.code).to eq(int)
  expect($delete.message).to eq("OK")

  puts "ID    : #{$delete["id"]}"
  puts "Data  : #{$delete["data"]}"
  puts "Nome  : #{$delete["nome"]}"
  puts "Conta : #{$delete["conta"]}"
  puts "Cidade: #{$delete["cidade"]}"
  puts "Status Code: #{$delete.code}"
end