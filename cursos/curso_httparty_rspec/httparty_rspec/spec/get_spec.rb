describe 'fazer uma requisição' do
  it 'get sem module' do
    @primeira_requisicao = HTTParty.get('https://api-de-tarefas.herokuapp.com/contacts/')
    puts @primeira_requisicao
  end
  it 'get usando module' do
    puts  '==============================================='
    puts  '|              MELHOR OPCAO                    |'
    puts  '==============================================='
    @melhor_opcao = Contato.get('/contacts/')
    puts @melhor_opcao
  end
end