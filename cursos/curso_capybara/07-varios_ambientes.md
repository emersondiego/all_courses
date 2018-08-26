## AULA 51 - Rodando em vários ambientes

- cucumber.yml

````
Um profile basico do cucumber pode consitir em um "profile default" (nota: você pode especificar mais variaveis de ambiente para uso em profiles de ataque e os ambientes em que esses executam podem ter diferentes nomes de host)
````

````yml
## yml templates

---

default: -p homolog -p chrome -p pretty
pretty: -- format pretty
progress: --format progress
homolog: ambiente=homolog
production: ambiente=producao
chrome: browsers=chrome
firefox: browsers=firefox
````

Pratica:

`pasta: 07-varios_ambientes`

1 - Criar arquivo na raiz do projeto arquivo "cucumber.yml"

````yml
---

default: --profile pretty

pretty: --format pretty
progress: --format progress
````


2 - No arquivo env.rb criar constantes para chamar o ambiente e e reconhecer o arquivo yml.

````ruby
AMBIENTE = ENV['AMBIENTE']
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/ambientes/#{AMBIENTE}.yml")
````

3 - dentro da pasta support criar uma nova pasta chamada ambientes e criar dois arquivos dentro dessa pasta

arquivo1 homolog.yml

````yml
url_padrao: 'https://automacaocombatista.herokuapp.com/'
````

arquivo2 producao.yml

````yml
url_padrao: 'https://automacaocombatista.herokuapp.com/'
````

4 - No arquivo oenv.rb alterar a linha `config.app_host`, chamando a CONFIG criada

````ruby
  config.app_host = CONFIG['url_padrao']
````

5 - Incluir as variaveis de ambientedentro do cucumber.yml que vai concatenar com a CONFIGs que foi criada no arquivo env.rb

````ruby
---

default: --profile pretty -p homolog

pretty: --format pretty
progress: --format progress
homolog: AMBIENTE=homolog
producao: AMBIENTE=producao
````

Exemplo saida terminal:

````ruby
╰─➤  bundle exec cucumber features/specs/mapeando_elementos.feature                                                                                                                                              130 ↵
Using the default, pretty and homolog profiles...
# language: pt
@mapeando_elementos
Funcionalidade: Mapear elementos

  Cenário: Preecnher cadastro com sucesso # features/specs/mapeando_elementos.feature:6
    Quando preencho o formulario          # features/step_definitions/mapeando_elementos.rb:1

1 scenario (1 passed)
1 step (1 passed)
0m6.501s
````

## AULA 52 - Rodando em vários browsers

````
Por padão como falados em aulas anteriores o capybra possui três drives: selenium, selenium_chrome, selenium_chrome_headless
Mas temos um serie de navegadores e em algum momentos precisaremos usar outros, e é isso que vamos explicar nessa aula
````

````ruby
# Driver Browsers

Capybara::Selenium::Driver.new(app, :browser => :chrome)
Capybara::Selenium::Driver.new(app, :browser => :firefox, :marionette => true)
Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)
Capybara::Selenium::Driver.new(app, :browser => :safari)

options = {js_errors: false}
Capybara::Poltergeist::Driver.new(app, options)
````

Pratica;

1 - No arquivo cumcumber.yml incluir navegadores e chamar constante no default

````yml
---

default: --profile pretty -p homolog -p chrome

pretty: --format pretty
progress: --format progress
homolog: AMBIENTE=homolog
producao: AMBIENTE=producao

chrome: BROWSER=chrome
firefox: BROWSER=firefox
safari: BROWSER=safari
ie: BROWSER=ie
poltergeist: BROWSER=poltergeist
````


2 -  No arquivo env.rb alterar a chamada do config.default_driver:
Dessa forma conseguiremos sobrescrever o selenium para o que desejamos chamar no momento

Criar constante para que o browser escolhido seja setado no arquivo cucumber.yml

````ruby
BROWSER = ENV['BROWSER']
````

De 
````ruby
  config.default_driver = :selenium_chrome
````
Para 
````ruby
    config.default_driver = :selenium
````

``
Como não temos o drivers dos navegadores ie, safari e poltergeist, não ira conseguir rodar. Mas caso seja necessario só realizar a instalação dos drivers
``

3 -  Também no arquivo env.rb configurar o selenium

````ruby
Capybara.register_driver :selenium do |app|
  if BROWSER.eql?('chrome')
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  elsif BROWSER.eql?('firefox')
    Capybara::Selenium::Driver.new(app, :browser => :firefox, :marionette => true)
  elsif BROWSER.eql?('ie')
    Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)
  elsif BROWSER.eql?('safari')
    Capybara::Selenium::Driver.new(app, :browser => :safari)
  elsif BROWSER.eql?('poltergeist')
    options = {js_errors: false}
    Capybara::Poltergeist::Driver.new(app, options)
  end
end
````

``
Para rodar no firefox devemos incluir a gem no Gemfile
gem 'geckodriver-helper', '~> 0.21.0'
``

## AULA 53 - Rodando com Headless e sem Headless

````
Headless é rodar em modo GPU, sem subir browser.
````

Capabilities

````
Capabilities são opções que voc6e pode usar para personalizar uma sessão do chromedriver. Esta página documenta todos os recusrsos suportados pelo chromedriver e como usá-los.
http://chromedriver.chromium.org/capabilities
````


Pratica:

1 - Modificação arquivo env.rb para os capabilities que fazem com que os navegadores funcionem em modo headless

````ruby
Capybara.register_driver :selenium do |app|
  if BROWSER.eql?('chrome')
    Capybara::Selenium::Driver.new(app, :browser => :chrome)

#######################################
  elsif BROWSER.eql?('chrome_headless')
    Capybara::Selenium::Driver.new(app, :browser => :chrome,
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
        'chromeOptions'=> { 'args' => ['--headless', 'disable-gpu'] }
      )  
    )
  elsif BROWSER.eql?('firefox')
    Capybara::Selenium::Driver.new(app, :browser => :firefox, :marionette => true)
  elsif BROWSER.eql?('firefox_headless')
    browser_options = Selenium::WebDriver::Firefox::Options.new(args: ['--headless'])
    Capybara::Selenium::Driver.new(
      app, :browser => :firefox, 
      options: browser_options)
#####################################      

  elsif BROWSER.eql?('ie')
    Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)
  elsif BROWSER.eql?('safari')
    Capybara::Selenium::Driver.new(app, :browser => :safari)
  elsif BROWSER.eql?('poltergeist')
    options = {js_errors: false}
    Capybara::Poltergeist::Driver.new(app, options)
  end
end
````

2 - Incluir as constantes criadas no env.rb no arquivo cucumber.yml

````ruby
chrome_headless: BROWSER=chrome_headless
firefox_headless: BROWSER=firefox_headless
````

Para rodar executar:

````ruby
ruby
╰─➤  bundle exec cucumber features/specs/mapeando_elementos.feature 
````

Caso queira mudar um navegador mude a sentença no arquivo cucumber.yml para o navegador destacado 

````ruby
default: --profile pretty -p homolog -p <navegador_desejado>
````