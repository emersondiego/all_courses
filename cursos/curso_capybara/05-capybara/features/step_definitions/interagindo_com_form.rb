Quando("eu faco cadastro") do
  visit '/users/new'
  fill_in(id: 'user_name', with: "Emerson")
  find('#user_lastname').set("Pereira")
  find('#user_email').send_keys('teste@teste.com.br')
  fill_in(id: 'user_address', with: "Rua 1234")
  find('#user_university').set("UNIB")
  find('#user_profile').send_keys('QA')
  fill_in(id: 'user_gender', with: "masculino")
  find('#user_age').set("30")
  find('input[value="Criar"]').click
end

Entao("verifico se fui cadastrado") do
  texto = find('#notice')
  expect(texto.text).to eql 'Usuário Criado com sucesso'
end