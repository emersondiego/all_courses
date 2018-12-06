describe 'fazer requisicao' do
  it 'delete sem modulo' do
    @req = HTTParty.delete('https://api-de-tarefas.herokuapp.com/contacts/13') 
    puts @req
  end

  it 'delete com modulo' do
    @req = Contato.delete('/contacts/13') 
    puts @req
  end
end