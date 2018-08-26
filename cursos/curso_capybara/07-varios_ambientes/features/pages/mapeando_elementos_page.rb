class MapeandoElementoPage < SitePrism::Page
  set_url '/users/new'

  element :nome, '#user_name'
  element :sobrenome, '#user_lastname'
  element :email, '#user_email'
  element :address, '#user_address'

  def preencher
    nome.set 'Testando'
    sobrenome.set 'Teste'
    email.set 'Testando'
    address.set 'Testando'
  end
end