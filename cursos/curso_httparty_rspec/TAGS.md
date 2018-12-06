# TAGS

## Usando Tags

```ruby
describe 'trabalhando com tags', nome_tag: true do
  it 'it com tags' do
    puts "usei a tag nome_tag"
  end
end
```

1 - Dentro do repositório criado *rspec* na pasta *spec*, criar arquivo chamado **tags_spec.rb**

2 - Incluir código abaixo:

```ruby
describe 'trabalhando com', tag: true do
  it 'tags' do
    puts "usei a tag"
  end
end

describe 'andando com', :andando do
  it 'bicicleta' do
    puts "Andei de Bicicleta"
  end
end

# não quero que seja executado este describe
describe 'estudando', :rspec do
  it 'rspec' do
    puts "estudei Rspec"
  end
end
```

Saída terminal chamando apenas uma tag:

```
╰─➤  rspec . --tag tag spec/tags_spec.rb
Entrou no Describe
Run options: include {:tag=>true}
usei a tag
.

Finished in 0.00117 seconds (files took 0.08529 seconds to load)
1 example, 0 failures
```

Saída terminal rodando a tag com simbolo:

```
╰─➤  rspec . --tag andando spec/tags_spec.rb                                                                                   1 ↵
Entrou no Describe
Run options: include {:andando=>true}
Andei de Bicicleta
.

Finished in 0.002 seconds (files took 0.08867 seconds to load)
1 example, 0 failures
```

``
Não rodando terminada tag
``

3 - No arquivo .rspec incluir:

```
--tag ~rspec
```

.rspec

```
--require spec_helper
--tag ~rspec
```

Saída terminal excluindo terminada tag:

```
╰─➤  rspec spec/tags_spec.rb
Run options: exclude {:rspec=>true}
usei a tag
.Andei de Bicicleta
.

Finished in 0.00122 seconds (files took 0.08353 seconds to load)
2 examples, 0 failures
```