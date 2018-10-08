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
end
