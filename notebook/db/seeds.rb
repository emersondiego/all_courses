# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# rodando rake db:seed ele cria o que é passado nesse arquivo


# ===Primeira inclusâo===
# Kind.create(description: "Amigo")
# Kind.create(description: "Contato")
# Kind.create(description: "Comercial")

# ===Segunda inclusão - refatorada=== "!" com esse simbolo ele grava de verdade no BD"
puts "Gerando os tipos de Contatos (Kinds)..."
Kind.create!([ {description: "Amigo"},
              {description: "Contato"},
              {description: "Comercial"}])
puts "Gerando os tipos de Contatos (Kinds)... [OK]"
              
              
puts "Gerando os Contatos (Contacts)..."
  10.times do |i|
    Contact.create!(
      name: Faker::Name.name, 
      email: Faker::Internet.email,
      rmk: Faker::Lorem.paragraph([1,2,3,4,5].sample),
      kind: Kind.all.sample # pega uma amostra e joga nesse contato
    )
  end
puts "Gerando os Contatos (Contacts)... [OK]"




