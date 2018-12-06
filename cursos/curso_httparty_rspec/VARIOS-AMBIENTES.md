# RODANDO OS TESTES EM VARIOS AMBIENTES

## Passo a Passo

1 - Incluir vários de ambiente no *spec_helper*

```ruby
@rspec_yml = YAML.load_file("#{Dir.pwd}/support/rspec.yml") # carrega o arquivo yml dentro da variavel criada
@ambiente = @rspec_yml['ambiente'] # recebe atributo que do yml e joga dentro da variavel ambiente
CONFIG = YAML.load_file("#{Dir.pwd}/support/data/#{@ambiente}.yml") # criamos uma constante chamada CONFIG que carrega o arquivo ambiente
```

```ruby
require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'
require 'faker'

@rspec_yml = YAML.load_file("#{Dir.pwd}/support/rspec.yml")
@ambiente = @rspec_yml['ambiente'] 
CONFIG = YAML.load_file("#{Dir.pwd}/support/data/#{@ambiente}.yml")

require_relative '../services/contatos_service.rb'
require_relative '../services/criar_service.rb'

RSpec.configure do |config|
  include Contato
  include Criar
```

2 - Criar na raiz do projeto pasta *support* e dentro dessa pasta criar o arquivo *rspec.yml*

3 - Criar parâmetros dentro do arquivo *rspec.yml*

```yml
---
ambiente: homolog
```

4 - Criar dentro da pasta *support* outra pasta chamada *data* e criar arquivo *homolog.yml*

```yml
---
url_padrao: 'https://api-de-tarefas.herokuapp.com'
```

``Caso queria rodar em outro ambiente de teste, seria necessario criar arquivo yml do ambiente na pasta data, e em seguida mudar no arquivo rspec.yml para o nome do ambiente desejado``

### Como usar com e mudança de estrutura

Dentro dos arquivos *contatos_service.rb* e *criar_service.rb* mudar o endpoint base para o parâmetro url_padrao

Antes contatos_service.rb: 

```ruby
module Contato
  include HTTParty
  base_uri 'https://api-de-tarefas.herokuapp.com'
  format :json
  headers Accept: 'application/vnd.tasksmanager.v2',
                  'Content-Type': 'application/json'
end
```

Depois contatos_service.rb: 

```ruby
module Contato
  include HTTParty
  base_uri CONFIG['url_padrao']
  format :json
  headers Accept: 'application/vnd.tasksmanager.v2',
                  'Content-Type': 'application/json'
end
```

Antes criar_service.rb.rb: 

```ruby
module Criar
  include HTTParty
  base_uri 'https://api-de-tarefas.herokuapp.com'
  format :json
end
```

Depois criar_service.rb.rb: 

```ruby
module Criar
  include HTTParty
  base_uri CONFIG['url_padrao']
  format :json
end
```
Ou seja ele acessa os arquivo de ambiente e atribui a url desejada

### Executando.

Comando terminal: 

```
rspec
```
``Caso queira rodar em outro ambiente é preciso alterar o arquivo rspec.yml com o ambiente desejado``