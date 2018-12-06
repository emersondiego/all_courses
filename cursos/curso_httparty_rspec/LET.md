# Let

## Usando o let

```ruby
describe 'somar' do
  context 'somar numeros' do
    let(:resultado) { 2 + 2 }
    it 'positivos' do
      # resultado + 2
    end
  end
end
```

1 - Dentro do repositório criado *rspec* na pasta *spec*, criar arquivo chamado **let_spec.rb**

2 - Incluir código abaixo:

```ruby
describe 'Soma' do
  context 'somar numeros' do
    let(:resultado) { 4 + 4 }
    it 'positivos' do
      expect(resultado).to eq 8     
    end
  end
end
```

Saída terminal:

```
╰─➤  rspec spec/let_spec.rb                                                                                   
.
Finished in 0.00225 seconds (files took 0.07887 seconds to load)
1 example, 0 failures
```

``
Dica: é possivel usar varios lets, com nomes diferentes e também posso chamar um let dentro de um novo let.
``
Exemplo:

- let(:resultado) { 4 + 4 }
- let(:resultado_2) { resultado + 4 }
- let((:resultado_3) { resultado + resultado_2 }
