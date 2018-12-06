# Projeto Final

```
Projeto do zero de API
Relaizar Login.
Utilizar o token para realizar tarefa
```
### Mãos a Obra

1 - Iniciar projeto com rspec no terminal

```
rspec --init
```
Saída terminal:

```
╰─➤  rspec --init
  create   .rspec
  create   spec/spec_helper.rb
```

2 - Criar arquivo na raiz do projeto *Gemfile* e instalar as gems httpasrt e rspec

```ruby
source 'http://rubygems.org'
gem 'httparty'
gem 'rspec'
```

3 - Instalar as gems com o comando *bundle install* no terminal

4 - Criar uma pasta na raiz chamada *services* e dentro dela um arquivo chamado *login_servive.rb*

5 - Criar o modulo de login dentro do arquivo criado

```ruby
module Login
  include HTTParty
  base_uri 'https://api-de-tarefas.herokuapp.com'
  format :json
  headers Accept: 'application/vnd.taskmanagers.v2',
          'Content-Type': 'application/json'      
end
```

6 - Incluir o modulo Login como global no *spec_helper* e o caminho relativo desse arquivo e incluir, e require do httparty e rspec

```ruby
require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'

require_relative '../services/login_service.rb'

RSpec.configure do |config|
  include Login


```

7 - Na raiz do projeto no arquivo *.rspec* incluir a linha pra gerar relatórios

```
--format html --out results/rspec_results.html
```

8 - Voltando ao arquivo *spec_helper* e inclui configuração para dados no terminal mas claros

```ruby
require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'


require_relative '../services/login_service.rb'

RSpec.configure do |config|
  include Login
  config.color = true
  config.formatter = :documentation
  
  # rspec-expectations config goes here. You ca
```

9 - Dentro de *services* cirar uma is serviço chamado **cadastrar_service.rb**

```ruby
module Cadastrar
  include HTTParty
  base_uri 'https://api-de-tarefas.herokuapp.com'
  format :json
end
```

10 - Novamente no *spec_helper* incluir o modulo cadastrar para ser global e informar o caminho relativo

```ruby
require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'

require_relative '../services/login_service.rb'
require_relative '../services/cadastrar_service.rb'


RSpec.configure do |config|
  include Login
  include Cadastrar

  config.color = true
  config.formatter = :documentation
  
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
```

11 - Na pasta *spec* criar arquivo **cadastrar_tarefa_spec.rb**

Incluir código:

```ruby
describe 'Cadastrar' do
  def login(field_email, field_password)
    @body = {
      session: {
        email: field_email,
        password: field_password
      }
    }.to_json

    @login = Login.post('/sessions', body: @body)
    puts @login.body
    puts ''
  end

  context 'tarefas' do
    before { login('brunobatista66@gmail.com', '123456') } # metodo login é executado nessa chamada
   
    it 'com sucesso' do
      @header = {
        'Content-Type': 'application/json',
        Accept: 'application/vnd.tasksmanager.v2',
        Authorization: @login.parsed_response['data']['attributes']['auth-token']
      }

      @body = {
        task: {
          title: 'Tarefa',
          description: 'Descrição da tarefa 122',
          deadline: '2018-12-15 14:00:00',
          done: true
        }
      }.to_json

      @tarefas = Cadastrar.post('/tasks', body: @body, headers: @header)
      puts @tarefas
      expect(@tarefas.parsed_response['data']['attributes']['title']).to eq "Tarefa" 
    end
  end
end
```

## Executando teste

No terminal digitar comando rspec

```
╰─➤  rspec spec/cadastrar_tarefa_spec.rb

Cadastrar
  tarefas
{"data":{"id":"12","type":"users","attributes":{"email":"brunobatista66@gmail.com","auth-token":"usrhpWBmYrzMEa92kZ-Q","created-at"
:"2018-08-18T23:09:49.243Z","updated-at":"2018-12-06T19:07:31.958Z"}}}

{"data":{"id":"210","type":"tasks","attributes":{"title":"Tarefa","description":"Descrição da tarefa 122","done":true,"deadline":"2
018-12-15T14:00:00.000Z","user-id":12,"created-at":"2018-12-06T19:07:32.597Z","updated-at":"2018-12-06T19:07:32.597Z","short-descri
ption":"Descrição da tarefa 122","is-late":false},"relationships":{"user":{"data":{"id":"12","type":"users"}}}}}
    com sucesso

Finished in 1.55 seconds (files took 0.21513 seconds to load)
1 example, 0 failures
```
