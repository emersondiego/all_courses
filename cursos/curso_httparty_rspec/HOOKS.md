# HOOKS

## Usando o hooks

```ruby
describe 'an error in before' do
  before(:all) do 
    raise "oops"
  end

  it 'fails this example' do
  end

  after(:all) do
    puts "After all ran"
  end  
end
```

1 - Dentro do repositório criado *rspec* na pasta *spec*, criar arquivo chamado **before_after_spec.rb**

2 - Incluir código abaixo:

```ruby
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
```

Saída terminal:

```
╰─➤  rspec spec/before_after_spec.rb                                                                                         
executando antes dos testes
Executando teste
executando depois dos testes
.

Finished in 0.0024 seconds (files took 0.07627 seconds to load)
1 example, 0 failures
```