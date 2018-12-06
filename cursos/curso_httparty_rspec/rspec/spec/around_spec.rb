describe 'usando around' do
  around(:each) do |testes|
    puts 'Executado comandos antes dos testes'
    testes.run
    puts 'Executado comandos depois dos testes'
  end
  it 'de dois numeros' do
    total = 2 + 2
    expect(total).to eq 4
    puts "Executando teste"
    puts "O total é: #{total}"
  end
end