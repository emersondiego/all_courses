## 55 - Automatizando end-to-end

1- criar pasta e criar estrutura do projeto

```
cucumber --init
```

2 - Na pasta raiz criar o arquivo Gemfile

```ruby
source 'http://rubygems.org'

gem 'capybara'
gem 'chromedriver-helper'
gem 'cucumber'
gem 'geckodriver-helper', '~> 0.21.0'
gem 'rspec'
gem 'selenium-webdriver'
gem 'site_prism', '2.13'
```
3 - Adicionar no requires no arquvo env.rb e configurando o Capybara

```ruby
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = 'https://automacaocombatista.herokuapp.com'
  config.default_max_wait_time = 10
end
```

4 - Criar duas pastas dentro de features specs (executar as features) e pages (po)

5 - Na pasta raiz criar a pasta reports

6 - Criar arquivo hooks.rb dentro de support para configurar o screenshot

```ruby
After do |scenario|
  scenario_name = scenario.name.gsub(/\s+/,'_').tr('/','_')
  if scenario.failed?
    tirar_foto(scenario_name.downcase!, 'falhou')
  else
    tirar_foto(scenario_name.downcase!, 'passou')
  end
end
```

7 - Criar arquivo helper.rb dentro de support

````ruby
module Helper
  def tirar_foto(nome_arquivo, resultado)
    caminho_arquivo = "reports/screenshot/test_#{resultado}"
    foto = "#{caminho_arquivo}/#{nome_arquivo}.png"
    page.save_screenshot(foto)
    embed(foto, 'image/png', 'Clique Aqui!')
  end
end
````

8 - No env.rb dar require dos helpers criados e inclui-lo como global

````ruby
require_relative 'helper.rb'
World(Helper)
````

10 - Vamos configurar o cucumber, criar arquivo cucumber.yml na pasta raiz

````yml
---

default: -p pretty -p homolog

pretty: --format pretty
homolog: AMBIENTE=homolog
````

11 - Dentro de support criar pasta ambientes e criar arquivo homolog.yml

````yml
url_padrao: 'https://automacaocombatista.herokuapp.com'
````

12 - Vamos configurar o ambiente dentro do arquivo env.rb

````ruby
AMBIENTE = ENV['AMBIENTE']
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/ambientes/#{AMBIENTE}.yml")
````

13 - No arquivo env.rb aterar a url padrão do capybara para chamar pela constante config criada

````ruby
Capybara.configure do |config|
  config.default_driver = :selenium_chrome

  config.app_host = CONFIG['url_padrao']

  config.default_max_wait_time = 10
end
````

14 - Criar nosso cenarios criar_usuario.feature dentro de specs.

````ruby
#language: pt

Funcionalidade: Criar Usuario

-Eu como Usuario
-Quero me cadastrar com sucesso

@criar_usuario
Cenario: Cadastrar com sucesso
Quando eu cadastro meu usuario
Entao verifico se o usuario foi cadastrado
````

15 - Criar nosso arquivo criar_usuario.rb em step-definitions com os steps gerados no terminal

````ruby
Quando("eu cadastro meu usuario") do
  pending # Write code here that turns the phrase above into concrete actions
end

Entao("verifico se o usuario foi cadastrado") do
  pending # Write code here that turns the phrase above into concrete actions
end
````

16 - Criar nosso Pageobject para mapear os elementos em pages/criar_usuario_page.rb

````ruby
class User < SitePrism::Page
  set_url '/users/new'

  element :nome, '#user_name'
  element :sobrenome, '#user_lastname'
  element :email, '#user_email'
  element :endereco, '#user_address'
  element :universidade, '#user_university'
  element :profissao, '#user_profile'
  element :genero, '#user_gender'
  element :idade, '#user_age'
  element :btn_criar, 'input[value="Criar"]'
  
  def preencher_usuario
    nome.set 'Teste'
    sobrenome.set 'Testes'
    email.set 'teste@tte.com'
    endereco.set 'Rua um dois'
    universidade.set 'Unib'
    profissao.set 'Analista'
    genero.set 'Masculino'
    idade.set '30'
    btn_criar.click
  end
end
````

17 - Criar um arquivo em support chamado page_helper.rb

````ruby
Dir[File.join(File.dirname(__FILE__), "../pages/*_page.rb")].each { |file| require file }

module Pages
  def user
    @user ||= User.new
  end
end
````

18 - Incluir o modulo Pages criado como global dentro de env.rb e dar um require nele

````ruby
require_relative 'page_helper.rb'

World(Pages)
````

18 - Acrescentar em nosso cucumber.yml relatório

````yml
---

default: -p pretty -p homolog -p html

pretty: --format pretty
homolog: AMBIENTE=homolog
html: --format html --out=reports/relatorio.html
````

19 - arquivo criar_usuario preenchido com os dados do PO

````ruby
Quando("eu cadastro meu usuario") do
  user.load
  user.preencher_usuario
end

Entao("verifico se o usuario foi cadastrado") do
  texto = find('#notice')
  expect(texto.text).to eq 'Usuário Criado com sucesso'
end
````

20 - Rodando o cenario

comando
``
bundle exec cucumber -t@criar_usuario
``

Saida terminal:

````ruby
╰─➤  bundle exec cucumber -t@criar_usuario
Using the default, pretty, homolog and html profiles...
# language: pt
Funcionalidade: Criar Usuario
-Eu como Usuario
-Quero me cadastrar com sucesso

  @criar_usuario
  Cenario: Cadastrar com sucesso               # features/specs/criar_usuario.feature:9
    Quando eu cadastro meu usuario             # features/step_definitions/criar_usuario.rb:1
    Entao verifico se o usuario foi cadastrado # features/step_definitions/criar_usuario.rb:6

1 scenario (1 passed)
2 steps (2 passed)
0m12.122s
````

### Aprendemos no curso:

- Configuração de ambientes (windows, linux e mac)

- Ruby basico

- Cucumber (esquema de cenario, contexto, data table, tags, hooks, etc)

- Mepear elementos (css, xpath)

- Capybara (instação, configuração e drives, busca de elementos, trabalhando com forms,verificar elementos, mouse over, iframe e modal, window e alerts, upload de arquivos, etc)

- Page Objects com Site_Prism

- Varios ambientes (ambientes, navegadores, headless)

- Relatórios (html, screenshot)