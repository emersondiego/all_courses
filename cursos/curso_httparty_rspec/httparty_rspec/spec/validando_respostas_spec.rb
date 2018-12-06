describe 'fazer uma requisição' do
  it 'get usando module' do
    @melhor_opcao = Contato.get('/contacts/7')
    puts @melhor_opcao
    puts @melhor_opcao.code 
    expect(@melhor_opcao.code).to eq 200
    puts @melhor_opcao.body

    puts @melhor_opcao.parsed_response['data']['attributes']['name']
    expect(@melhor_opcao.parsed_response['data']['attributes']['name']).to eq 'bruno' 
    expect(@melhor_opcao.parsed_response['data']['attributes']['last-name']).to eq 'basita' 
    expect(@melhor_opcao.parsed_response['data']['attributes']['age']).to eq 56 
  end
end