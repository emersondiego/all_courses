# CONTEXT

## Usando o context

```ruby
describe 'Soma' do
  context 'somar dois numeros' do
    it 'negativos' do
      # -2 + (-2)
    end
    it 'positivos' do
      # 2 + 2 
    end
  end
end
```

1 - Dentro do repositório criado *rspec* na pasta *spec*, criar arquivo chamado **context_spec.rb**

2 - Incluir código abaixo:

```ruby
describe 'Soma' do
  context 'somar dois numeros' do
    it 'negativos' do
      total = -3 + (-3)
      expect(total).to eq -6
    end
    it 'positivos' do
      total = 3 + 3
      expect(total).to eq 6
    end
  end
end
```

Saída terminal:

```
╰─➤  rspec spec/context_spec.rb
..

Finished in 0.00287 seconds (files took 0.80948 seconds to load)
2 examples, 0 failures
```