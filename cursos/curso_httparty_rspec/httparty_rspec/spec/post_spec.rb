describe 'fazer uma requisição' do
  it 'post sem utilizar o modulo criado' do
    @body = {
      "name": "Emersom",
      "last_name": "Pereira",
      "email": "gmail1@gmail.com",
      "age": "30",
      "phone": "48258659575",
      "address": "Rua Central",
      "state": "São Paulo",
      "city": "São Paulo"
    }.to_json

    @headers = {
      'Accept': 'application/vnd.tasksmanager.v2',
      'Content-Type': 'application/json'
    }

    @request = HTTParty.post('https://api-de-tarefas.herokuapp.com/contacts', body: @body ,headers: @headers)
    puts @request
  end
  it 'post utilizando modulo forma mais usada' do
    @body1 = {
      "name": "Diego",
      "last_name": "Pereira",
      "email": "new1@gmail.com",
      "age": "30",
      "phone": "44858659575",
      "address": "Rua Central",
      "state": "São Paulo",
      "city": "São Paulo"
    }.to_json

    @request1 = Contato.post('/contacts', body: @body1)
    puts @request1
  end
end