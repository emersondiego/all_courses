# RELATÓRIOS COM RSPEC

## Passo a Passo 

### Incluindo leitura no terminal

Como fazer:

1 - Incluir no arquivo spec_helper o trecho de código abaixo:

```ruby
RSpec.configure do |config|
  include Contato
  include Criar

  config.color = true # print cor na tela
  config.formatter = :documentation # quando usado este metodo será listado todos os describes, contextos e its.
```

``documentation = deixa mais explicado o que esta sendo executado printando na o passo a passo``

Saída terminal:

```
╰─➤  rspec spec/delete_spec.rb

fazer requisicao
  delete sem modulo
  delete com modulo

Finished in 1.27 seconds (files took 0.25861 seconds to load)
2 examples, 0 failures
```

### Gerando relatórios para serem consumidos por outras areas

Como fazer:

1 - No arquivo *.rspec* incluir a seguinte linha de código:

```
--format html --out results/rspec_results.html
```
``Irá imprimir um relatório em formato html no diretório informado``

Pode ser usado o formato json

```
--format json --out results/rspec_results.json
```

```
Mais utilizada caso queira digitar o resultado com algum api 
```