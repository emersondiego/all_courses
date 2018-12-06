# HTTPARTY

## Configurando o HTTParty

1 - Criar um projeto, exemplo chamado **httparty_rspec**

2 - Dentro do projeto (httparty_rspec) via terminal iniciar um projeto Rspec

```
╰─➤  rspec --init
  create   .rspec
  create   spec/spec_helper.rb
```

3 - Criar o arquivo Gemfile e adicionar a gem httparty, rspec

```ruby
source 'http://rubygems.org'

gem 'httparty'
gem 'rspec'
```

4 - Feito isso, executa o comando *bundle install* no terminal para instalar as gems

Saída Terminal:

```
╰─➤  bundle install
Fetching gem metadata from http://rubygems.org/..............
Resolving dependencies...
Using bundler 1.16.2
Using diff-lcs 1.3
Fetching mime-types-data 3.2018.0812
Installing mime-types-data 3.2018.0812
Fetching mime-types 3.2.2
Installing mime-types 3.2.2
Fetching multi_xml 0.6.0
Installing multi_xml 0.6.0
Fetching httparty 0.16.3
Installing httparty 0.16.3
Using rspec-support 3.8.0
Using rspec-core 3.8.0
Using rspec-expectations 3.8.2
Using rspec-mocks 3.8.0
Using rspec 3.8.0
Bundle complete! 2 Gemfile dependencies, 11 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
Post-install message from httparty:
When you HTTParty, you must party hard!
```

5 - Dentro do repositório *spec* no arquivo **spec_helper.rb** vamos chamar as gms para serem consumidas.

```ruby
require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'
```
Esse require carrega os arquivos da gem do HTTParty

## Configurando o o URI e Opções

```
base_uri: serve para mapearmos a ulr base.
```

```ruby
base_uri 'http://google.com'
```

Como fazer:

1 - Na pasta *spec* do projeto *httparty_rspec*  criar pasta chamada **services**

2 - Dentro de services criar arquivo **contatos_service.rb**

3 - Inluir código:

```ruby
module Contato
  include HTTParty
  # url base
  base_uri 'https://api-de-tarefas.herokuapp.com'
  
=begin
  Opcoes do service
  toda vez que  que for chamado o endpoint a chamada url 
  chamada será a declara no base_uri, e terá o essas configuraçaões abaixo.
=end
  format :json
  headers Accept: 'application/vnd.tasksmanager.v2',
                  'Content-Type': 'application/json'
end
```
4 - Incluir no arquivo *spec_helper.rb* o modulo de Contato como global, e dar um require no caminho do arquivo do modulo.

```ruby
require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'
# referencia de onde esta o arquivo com o modulo contato
require_relative '../services/contatos_service.rb'

RSpec.configure do |config|
  include Contato
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
```

## Utilizando Get

Como utilizar:

```ruby
HTTParty.get('https://api-de-tarefas.herokuapp.com')
```
Ou se tiver usando as opções do httparty:

```ruby
Listar.get('/')
```

Como fazer:

1 - Dentro da pasta *spec* criar arquivo chamado **get_spec.rb**

2 - Inclui código:

```ruby
describe 'fazer uma requisição' do
  # se não chamar o modulo
  it 'get sem module' do
    @primeira_requisicao = HTTParty.get('https://api-de-tarefas.herokuapp.com/contacts')
    puts @primeira_requisicao
  end

  # chamando o modulo de Contato
  it 'get usando module' do
    puts  '==============================================='
    puts  '|              MELHOR OPCAO                    |'
    puts  '==============================================='
    @melhor_opcao = Contato.get('/contacts')
    puts @melhor_opcao
  end
end
```
3 - Executar teste.

``Comando: rspec``

Saída terminal:

```
╰─➤  rspec{"data":{"id":"7","type":"contacts","attributes":{"name":"bruno","last-name":"basita","email":"brunotop378@gmail.com","age":56,"phone":"21984759575","address":"Rua dois","state":"Minas Gerais","city":"Belo Horizonte"}}}
.===============================================
|              MELHOR OPCAO                    |
===============================================
{"data":{"id":"7","type":"contacts","attributes":{"name":"bruno","last-name":"basita","email":"brunotop378@gmail.com","age":56,"pho
ne":"21984759575","address":"Rua dois","state":"Minas Gerais","city":"Belo Horizonte"}}}
.

Finished in 1.29 seconds (files took 0.20858 seconds to load)
2 examples, 0 failures
```

## Utilizando Post

Como utilizar:

```ruby
HTTParty.post('https://api-de-tarefas.herokuapp.com')
```
Ou se tiver usando as opções do httparty:

```ruby
Listar.post('/')
```

Exemplos:

```json
@body: {
  email: 'email@email.com',
  senha: '123456'
}.json

@header: {
  'Content-Type': 'application/json'
}
```

```ruby
HTTParty.post('https://www.google.com' body: @body, headers: @headers)

# ou se tiver usando as opções do httpary

Listar.post('https://www.google.com' body: @body, headers: @headers)
```

Como fazer:

1 - Dentro da pasta *spec* criar arquivo chamado **post_spec.rb**

2 - Inclui código:

```ruby
describe 'fazer uma requisição' do
  it 'post sem utilizar o modulo criado' do
    @body = {
      "name": "Emersom",
      "last_name": "Pereira",
      "email": "gmail1@gmail.com",
      "age": "30",
      "phone": "48258659575",
      "address": "Rua Central",
      "state": "São Paulo",
      "city": "São Paulo"
    }.to_json

    @headers = {
      'Accept': 'application/vnd.tasksmanager.v2',
      'Content-Type': 'application/json'
    }

    @request = HTTParty.post('https://api-de-tarefas.herokuapp.com/contacts', body: @body ,headers: @headers)
    puts @request
  end

  it 'post utilizando modulo forma mais usada' do
    @body1 = {
      "name": "Diego",
      "last_name": "Pereira",
      "email": "new1@gmail.com",
      "age": "30",
      "phone": "44858659575",
      "address": "Rua Central",
      "state": "São Paulo",
      "city": "São Paulo"
    }.to_json

    @request1 = Contato.post('/contacts', body: @body1)
    puts @request1
  end
end
```
3 - Executar teste.

``Comando: rspec``

Saída terminal:

```
╰─➤  rspec spec/post_spec.rb
{"data":{"id":"128","type":"contacts","attributes":{"name":"Emersom","last-name":"Pereira","email":"gmail1@gmail.com","age":30,"pho
ne":"48258659575","address":"Rua Central","state":"São Paulo","city":"São Paulo"}}}


.{"data":{"id":"129","type":"contacts","attributes":{"name":"Diego","last-name":"Pereira","email":"new1@gmail.com","age":30,"phone"
:"44858659575","address":"Rua Central","state":"São Paulo","city":"São Paulo"}}}
.

Finished in 1.42 seconds (files took 0.2078 seconds to load)
2 examples, 0 failures
```

## Utilizando Put e Patch

```
Diferença de put e patch.

Put é necessário passar todos os parametros para realizar a alteração incluindo id desejado;

Patch te possibilita alterar algum atributo que deseja passando o id desejado.
```

Como fazer:

1 - Dentro da pasta *spec* criar arquivo chamado **put_patch_spec.rb**

2 - Inclui código:

```ruby
describe 'fazer requisicao' do
  context 'para alterar dados' do
    it 'COM PUT' do
      @body_put = {
        "id": 15,
        "name": "Estaes",
        "last_name": "Davas",
        "email": "salveee@gmail.com",
        "age": "30",
        "phone": "48255555575",
        "address": "Rua Nova",
        "state": "São Paulo",
        "city": "São Paulo"
      }.to_json


      @requisicao_put = Contato.put('/contacts/15', body: @body_put)
      puts @requisicao_put    
    end

    it 'COM PATCH' do
      @body_patch = {
        "id": 15,
        "name": "Lavos",
        "last_name": "New",
        "email": "daeeee@gmail.com"
      }.to_json

      @requisicao_patch = Contato.patch('/contacts/15', body: @body_patch)
      puts @requisicao_patch
    end
  end
end
```
3 - Executar teste.

``Comando: rspec``

Saída terminal:

```
╰─➤  rspec spec/put_patch_spec.rb
{"data":{"id":"15","type":"contacts","attributes":{"name":"Estaes","last-name":"Davas","email":"salveee@gmail.com","age":30,"phone"
:"48255555575","address":"Rua Nova","state":"São Paulo","city":"São Paulo"}}}


.{"data":{"id":"15","type":"contacts","attributes":{"name":"Lavos","last-name":"New","email":"daeeee@gmail.com","age":30,"phone":"4
8255555575","address":"Rua Nova","state":"São Paulo","city":"São Paulo"}}}
.

Finished in 1.33 seconds (files took 0.20443 seconds to load)
2 examples, 0 failures
```

## Utilizando Put e Patch

Como fazer:

1 - Dentro da pasta *spec* criar arquivo chamado **delete_spec.rb**

2 - Inclui código:

```ruby
describe 'fazer requisicao' do
  it 'delete sem modulo' do
    @req = HTTParty.delete('https://api-de-tarefas.herokuapp.com/contacts/13') 
    puts @req
  end

  it 'delete com modulo' do
    @req = Contato.delete('/contacts/13') 
    puts @req
  end
end
```
3 - Executar teste.

``Comando: rspec``

Saída terminal:

```
╰─➤  rspec spec/delete_spec.rb
{"status":404,"error":"Not Found"}
.{"status":404,"error":"Not Found"}
.

Finished in 1.36 seconds (files took 0.20962 seconds to load)
2 examples, 0 failures
```

# RSPEC

## Validando resposta

Tipos de Validações:

- .code = Retorna os status da resposta
- .inspect = Retorna todas as informações da resposta
- .request = Retorna o valor da requisição de atributo
- .response = Retorna o valor da resposta do atributo
- .headers = Retorna o valor do cabeçalhos de atributo
- .body = Retorna o valor do atributo body
- .class = Retorna a classe # Converte para json o que vem como string
- .parsed_response = Retorna apenas dos dados do nome .parsed_response['data']['attributes']['name']


Como fazer:

1 - Dentro da pasta *spec* criar arquivo chamado **validando_respostas_spec.rb**

2 - Inclui código:

```ruby
describe 'fazer uma requisição' do
  it 'get usando module' do
    @melhor_opcao = Contato.get('/contacts/7')
    puts @melhor_opcao
    puts @melhor_opcao.code # mostra o status code da requisição
    expect(@melhor_opcao.code).to eq 200 # valida se o status code esta correto
    puts @melhor_opcao.body # retorna o corpo da requisição

    ## Usando parsed_response 
    # o parsed_response transforma toda string em json, caso a resposta ja venha como json utilizar o .body
    puts @melhor_opcao.parsed_response['data']['attributes']['name'] # usado para pegar um determinado atributo
    expect(@melhor_opcao.parsed_response['data']['attributes']['name']).to eq 'bruno' 
    expect(@melhor_opcao.parsed_response['data']['attributes']['last-name']).to eq 'basita' 
    expect(@melhor_opcao.parsed_response['data']['attributes']['age']).to eq 56 

    # Caso o retorno fosse um json, poderia utilizar o body direto
    # exemplo => expect(@melhor_opcao.body['data']['attributes']['name']).to eq 'bruno' 
  end
end
```
3 - Executar teste.

``Comando: rspec``

Saída terminal:

```
╰─➤  rspec spec/validando_respostas_spec.rb
{"data":{"id":"7","type":"contacts","attributes":{"name":"bruno","last-name":"basita","email":"brunotop378@gmail.com","age":56,"pho
ne":"21984759575","address":"Rua dois","state":"Minas Gerais","city":"Belo Horizonte"}}}

200

{"data":{"id":"7","type":"contacts","attributes":{"name":"bruno","last-name":"basita","email":"brunotop378@gmail.com","age":56,"pho
ne":"21984759575","address":"Rua dois","state":"Minas Gerais","city":"Belo Horizonte"}}}

bruno
.

Finished in 0.64569 seconds (files took 0.21685 seconds to load)
1 example, 0 failures
```

## Utilizando Token

``
Token uma senha de segurança para api, onde cada usuario possui seu determinado token para realizar determinadas requisições.
``

Exemplo:

```ruby
@body: {
  email: 'email@gmail.com',
  senha: '123456'
}.to_json

@header: {
  'Content-Type': 'application/json'
  'Authorization': 'ASDJHEnehadgaed87363'
}

HTTParty.post('https://www.google.com' body: @body, headers: @header)

# ou se tiver usando a opções do Hattparty

Listar.post('https://www.google.com' body: @body, headers: @header)
```

Como fazer:

1 - Dentro da pasta *services* criar arquivo chamado **criar_service.rb**

2 - Inclui código:

```ruby
module Criar
  include HTTParty
  base_uri 'https://api-de-tarefas.herokuapp.com'
  format :json
end
```

3 - No *spec_helper.rb* incluir o arquivo criado acima para ser chamado e incluir como global

```ruby
require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'
require_relative '../services/contatos_service.rb'
require_relative '../services/criar_service.rb'

RSpec.configure do |config|
  include Contato
  include Criar
  # rspec-expectations config goes here. You can use an alternate
```

4 - No *Gemfile* adicionar um gem chamada *faker* e no *spec_helper* fazer o require dessa gem

```ruby
source 'http://rubygems.org'

gem 'httparty'
gem 'faker'
gem 'rspec'
```

```ruby
require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'
require 'faker'
require_relative '../services/contatos_service.rb'
require_relative '../services/criar_service.rb'
```
5 - Instalar a gem via terminal

```
bundle install
```
6 - Dentro da pasta *spec* criar arquivo chamado **utilizando_token_spec.rb**

7 - Inclui código:

```ruby
describe 'usando' do
  it 'token' do
    @email = Faker::Internet.email

    # Criando usuario
    @body = {
      user: {
        email: @email,
        password: '123456',
        password_confirmation: '123456'
      }
    }.to_json

    @header = {
      Accept: 'application/vnd.taskmanager.v2',
      'Content-Type': 'application/json'
    }

    @criar = Criar.post('/users', body: @body, headers: @header)
    puts @criar.body

    @token = @criar.parsed_response['data']['attributes']['auth-token'] # percorre o nó do atributo e guarda em memoria o token
    puts @token # retorna o token unico do usuario

    ### Acessando sessão do usuario passando token criado
    @body_one = {
      session: {
        'email': @email,
        'password': '123456'
      } 
    }.to_json

    @header_one = {
      Accept: 'application/vnd.taskmanager.v2',
      'Content-Type': 'application/json',
      'Authorization': "#{@token}" #token aleatorio
       # ou'Authorization': "passando token direto" # porém o token precisa ser unico"
    }

    @login = Criar.post('/sessions', body: @body_one, headers: @header_one)
    puts @login.body # quando é feito login é gerado um novo token, mas não interfere no acesso
  end
end
```
8 - Executar teste.

``Comando: rspec``

Saída terminal:

```
╰─➤  rspec spec/utilizando_token_spec.rb
{"data":{"id":"306","type":"users","attributes":{"email":"glenn@cruickshank.net","auth-token":"soZyxmQ6Ld8qUHEzzf1s","created-at":"
2018-12-06T12:28:43.406Z","updated-at":"2018-12-06T12:28:43.406Z"}}}

soZyxmQ6Ld8qUHEzzf1s

{"data":{"id":"306","type":"users","attributes":{"email":"glenn@cruickshank.net","auth-token":"vmZ6f52yo6fcz9piezAs","created-at":"
2018-12-06T12:28:43.406Z","updated-at":"2018-12-06T12:28:44.230Z"}}}
.

Finished in 2.28 seconds (files took 0.31312 seconds to load)
1 example, 0 failures
```