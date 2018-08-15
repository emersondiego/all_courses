Quando("eu cadastro o usuario.") do
  visit '/users/new'
  fill_in(id: 'user_name', with: "teste")
  find('#user_lastname').set("teste")
  find('#user_email').send_keys('teste@teste.com.br')
  find('input[value="Criar"]').click
end

Entao("verifico se o usuario foi cadastrado.") do
  texto = find('#notice')
  expect(texto.text).to eq 'Usuário Criado com sucesso'
end

Quando("edito um usuario.") do
  find('.btn.waves-light.blue').click
end

Entao("verifico se o usuario foi editado.") do

end