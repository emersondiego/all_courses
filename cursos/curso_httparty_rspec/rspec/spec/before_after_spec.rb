describe 'usando hooks' do
  before(:each) do 
    puts "executando antes dos testes"
  end

  it 'teste padrão' do
    total = 5 + 5
    expect(total).to eq 10
    puts 'Executando teste'
  end

  after(:each) do
    puts "executando depois dos testes"
  end  
end