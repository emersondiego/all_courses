describe 'fazer requisicao' do
  context 'para alterar dados' do
    it 'COM PUT' do
      @body_put = {
        "id": 15,
        "name": "Estaes",
        "last_name": "Davas",
        "email": "salveee@gmail.com",
        "age": "30",
        "phone": "48255555575",
        "address": "Rua Nova",
        "state": "São Paulo",
        "city": "São Paulo"
      }.to_json


      @requisicao_put = Contato.put('/contacts/15', body: @body_put)
      puts @requisicao_put    
    end

    it 'COM PATCH' do
      @body_patch = {
        "id": 15,
        "name": "Lavos",
        "last_name": "New",
        "email": "daeeee@gmail.com"
      }.to_json

      @requisicao_patch = Contato.patch('/contacts/15', body: @body_patch)
      puts @requisicao_patch
    end
  end
end