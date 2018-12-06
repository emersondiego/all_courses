# HOOKS (AROUND)

## Usando o hooks (around)

```ruby
describe 'usando hooks' do
  around(:each) do |testes|
    puts 'roda antes'
    testes.run
    puts 'roda depois'
  end
  it 'de dois numeros' do
    total = 2 + 2
    expect(total).to eq 4
    puts "O total é: #{total}"
  end
end
```

1 - Dentro do repositório criado *rspec* na pasta *spec*, criar arquivo chamado **around_spec.rb**

2 - Incluir código abaixo:

```ruby
describe 'usando around' do
  around(:each) do |testes|
    puts 'Executado comandos antes dos testes'
    testes.run ## tudo que executado antes desse comando é a mesma coisa do Before
    ## tudo que for executado logo abaixo é a mesma coisa do After
    puts 'Executado comandos depois dos testes'
  end
  it 'de dois numeros' do
    total = 2 + 2
    expect(total).to eq 4
    puts "Executando teste"
    puts "O total é: #{total}"
  end
end
```

Saída terminal:

```
╰─➤  rspec spec/around_spec.rb
Executado comandos antes dos testes
Executando teste
O total é: 4
Executado comandos depois dos testes
.

Finished in 0.00231 seconds (files took 0.07702 seconds to load)
1 example, 0 failures
```