Before '@startup' do
  @nome = Faker::Company.name 
  @cidade = Faker::Address.city

  body = {
    "nome": @nome,
    "cidade": @cidade
  }

  @body = JSON.generate(body)

  @startup = Startup.new(@body)
end