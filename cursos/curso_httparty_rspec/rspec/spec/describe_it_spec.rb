describe 'Soma' do
  puts 'Entrou no Describe'

  it 'testar a soma de dois numeros' do
    total = 2 + 2 
    puts total
    expect(total).to eq 4
  end

  it 'testar soma de dois numeros negativos' do
    total = -2 + (-2) 
    puts total
    expect(total).to eq -4
  end
end