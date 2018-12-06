# DESCRIBE - IT

1 - Dentro do repositório criado *rspec* na pasta *spec*, criar arquivo chamado **describe_it_spec.rb**

*Dica sempre usar _spec.br no final de cada arquivo de teste.*

Exemplo:

```ruby
describe 'Soma' do
  it 'testar a soma de dois numeros' do
    # bloco onde iremos executar a soma
  end
end
```

2 - Incluir passo abaixo dentro do arquivo describe_it_spec.rb

```ruby
describe 'Soma' do
  puts 'Entrou no Describe'
  it 'testar a soma de dois numeros' do
    total = 2 + 2 
    puts total
  end
end
```

3 - Executar no terminal utilizando comando *rspec*

Saída Terminal:

```
╰─➤  rspec
Entrou no Describe
4
.

Finished in 0.00654 seconds (files took 0.10568 seconds to load)
1 example, 0 failures
```

4 - Incluir dentro do it o *expect*, isso irá garantir que a validação esta sendo feita:

```ruby
it 'testar a soma de dois numeros' do
  total = 2 + 2 
  puts total
  expect(total).to eq 4
end
```

*Caso altere o valor 4 para 5 no expect o teste deve falhar e a saída do terminal será:*

```
╰─➤  rspec
Entrou no Describe
4
F

Failures:

  1) Soma testar a soma de dois numeros
     Failure/Error: expect(total).to eq 5

       expected: 5
            got: 4

       (compared using ==)
     # ./spec/describe_it_spec.rb:7:in `block (2 levels) in <top (required)>'

Finished in 0.03552 seconds (files took 0.07963 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/describe_it_spec.rb:4 # Soma testar a soma de dois numeros
```