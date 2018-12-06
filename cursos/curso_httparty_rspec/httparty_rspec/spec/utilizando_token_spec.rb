describe 'usando' do
  it 'token' do
    @email = Faker::Internet.email

    # Criando usuario
    @body = {
      user: {
        email: @email,
        password: '123456',
        password_confirmation: '123456'
      }
    }.to_json

    @header = {
      Accept: 'application/vnd.taskmanager.v2',
      'Content-Type': 'application/json'
    }

    @criar = Criar.post('/users', body: @body, headers: @header)
    puts @criar.body

    @token = @criar.parsed_response['data']['attributes']['auth-token'] # percorre o nó do atributo e guarda em memoria o token
    puts @token # retorna o token unico do usuario

    ### Acessando sessão do usuario passando token criado
    @body_one = {
      session: {
        'email': @email,
        'password': '123456'
      } 
    }.to_json

    @header_one = {
      Accept: 'application/vnd.taskmanager.v2',
      'Content-Type': 'application/json',
      'Authorization': "#{@token}" #token aleatorio
       # ou'Authorization': "passando token direto" # porém o token precisa ser unico"
    }

    @login = Criar.post('/sessions', body: @body_one, headers: @header_one)
    puts @login.body # quando é feito login é gerado um novo token, mas não interfere no acesso
  end
end