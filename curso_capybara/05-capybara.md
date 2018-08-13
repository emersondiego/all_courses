# Curso de Automação de Testes com Capybara, Cucumber e Ruby

## AULA 25 - Instalando o Capybara e drivers

```
Capybara é um framework de automação de testes em apicaçòes web, open-source, e escrioto em ruby. É utilizado para testar as aplicações simulando as ações que o usuarios reias executariam na aplicação.
Para usar o capybara é necessario ter instalado o ruby.
```

1 - Instalar Capybara e Cucumber

``
gem install capybara
gem install cucumber
``

2 - Incluir a gem do Capybara e Cucumber no Gemfile

```
source 'http://rubygems.org'

gem 'capybara'
gem 'cucumber'
```

3 - Dentro do arquivo suppor/env.rb adcionar require abaixo:

`require 'capybara/cucumber'`

4 - Instalar o rspec e incluir no Gemfile

```
gem install rspec
```

```
gem 'rspec'
```

Selenium Webdriver

````
O webdriver é uma ferramenta de sw livre para testes automatizados de aplicativos da web em vários navegadores. Ele fornece recursos para navegar em páginas da web, entrada do usuario, execução de javascript e muito mais.
````

ChromeDriver

````
O ChromeDriver é um servidor autonomo que implementa o protocolo de conexao do webdriver para o Chromium.
O ChromeDriver está disponivel para o chrome no android e chromo on desktop (mac, linux, windows e chromeOS)
````

Instalando os drives

* [ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/home)

* [GeckoDriver](https://github.com/mozilla/geckodriver/releases)

```
Extraia o arquivo dentro da pasta urs/local/bin para Mac ou Linux
Para windows apenas extraia dentro da pasta c:/windows
```

Outra forma

```
Utilizando as gems: chromedriver-helper e geckodriver-helper

Para chrome e firefox tem uma possibilidade de usar as gems chromedriver-helper e geckodriver-helper.

Ele é uma gem que baixa e instala o chromedriver/geckodriver mas somente para o projeto que voce esta utilizando
```

- Incluir a gem 'selenium-webdriver' e 'chromedriver-helper' no Gemfile

```
gem 'chromedriver-helper'
gem 'selenium-webdriver'
```

5 - Realizar bundle install na raiz do projeto

6 - Incluir require do selenium-webdriver no env.rv

```
require 'selenium-webdriver'ss
```

## AULA 26 - Configurando o Capybara e Drivers

No arquivo env.rv configurar o Capybara

````
Capybara disponibiliza 3 drivers a serem configurados: selenium, selenium_chrome,  selenium_chrome_headless.
Quando escolhido for "selenium" por padrão roda o Firefox
Quando escolhido "selenium_chrome" vai executar no chrome
E quando escolhido "selenium_chrome_headless" vai executar no chrome em background (sem GPU)
````

Exemplo:

````ruby
Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = 'https://automacaocombatista.herokuapp.com/'
  config.default_max_time = 5
end
````

````
Linha 1
Capybara.configure do |config| = carrega toda a biblioteca do Capybara na variavel config.
Linha 2
config.default_driver = :selenium_chrome = define navegador default.
Linha 3
config.app_host = 'https://automacaocombatista.herokuapp.com' = define url padrão, onde inicia
Linha 4
config.default_max_wait_time = 5 # tempo default que espera os elementos ficarm visiveis na tela
````

## AULA 27 - Acessando o primeiro site

1 - Criar pasta specs dentro de features

2 - Criar arquivo cucumber "acessando_site.feature"

````ruby
#language: pt

@acessando_url
Funcionalidade: Acessar a primeira url

Cenario: Acessar a url com sucesso
Quando acesso a url 
Entao verifico se estou na pagina correta
````

3 - Criar arquivo "acessando_site.rb" em step_definitions

````ruby
Quando("acesso a url") do
  visit '/treinamento/home'
end

Entao("verifico se estou na pagina correta") do
  expect(page).to have_current_path('https://automacaocombatista.herokuapp.com/treinamento/home', url: true)
end
````
- visit '/treinamento/home' - Pega o root criado no arquivo env.rb e incrementa com a rota desejada.
- have_current_path - Valida se esta na url desejada

## AULA 28 - Buscando Elementos

Esses são os principais:

- all('elemento') - busca todos os elementos
- find('elemento') - busca um elemento mapeado
- first('elemento') - busca o primeiro elemento encontrado
- find_button - busca um botão na pagina
- find_link - busca um link na pagina
- find_by_id - busca o elemento com o id mapeado

Mais detalhes: https://www.rubydoc.info/github/teamcapybara/capybara/master/Capybara/Node/Finders

Opções:

- text (string,regexp) - busca por um tempo exatamente igual ao preenchimento
- exact_text (string, boolean) - busca um string exata ao preenchida
- visible (boolean, symbol) - busca elementos que estão visivel
- count (integer) - busca o exato numero de elementos encontrados na tela
- maximum (integer) - busca o maximo numero de elementos encontrados na tela
- minimun (integer) - busca o minimo de elementos encontrados na tela
- between (range) - busca um numero de elementos encontrados em uma determinada range
- exact (boolean) - busca um elemento exatamente igual ao regex criando por css ou xpath
- wait (integer, false) - espera o tempo delimitado pra espera o elemento aparecer na tela. (Se não preencher ele usa o tempo padrão do default_max_wait_time)

Pratica

1 - Criar arquivo cucumber "buscando_elementos.feature"

````ruby
#language: pt

@buscando_elementos
Funcionalidade: Buscando elementos

Cenario: Buscando elementos com sucesso
Quando acesso a url de botoes
Entao verifico se encontrei os elementos
````

2 - Criar arquivo de teste "buscando_elementos.rb"

````ruby
Quando("acesso a url de botoes") do
  visit '/buscaelementos/botoes'
end

Entao("verifico se encontrei os elementos") do
  # all busca todos os elementos que contenham o all
  page.all(:css, '.btn')
  # busca um elemento mapeado
  find('#teste')
  # busca pelo id
  find_by_id('teste')
  # busca por um botao 
  find_button(class: 'btn waves-light')
  # busca primeiro elementos que possui o elemento mapeado
  first('.btn')
  # busca por algum link
  find_link(href: 'https://www.youtube.com/channel/UCp554v_is_ZzjzSmAQyFfAA')
end
````

## AULA 29 - Clicando em links e botões

- find(elemento).click
- find(elemento).double_click
- find(elemento).right_click
- click_on: clica em links ou botoes
- click_link_or_button: tem a mesma ação do click_on
- click_button: clica no rimeiro botão encontrado pelo locator
- click_link: clica no link pelo id, texto ou title

Pratica:

1 - Criar arquivo cucumber "links_e_botoes.feature"

````ruby
#language: pt

@links_e_botoes
Funcionalidade: Clicando em links e botoes

Cenario: Clicar em botoes e links
Quando clico em botoes
````

2 - Criar arquivo de steps "links_e_botoes.rb"

````ruby
Quando("clico em botoes") do
  visit '/'
  click_on('Começar Automação') # click_link_or_button
  visit '/buscaelementos/botoes'
  click_button(class: 'btn waves-light')
  find('a[onclick="ativaedesativa2()"]').click
  find('a[onclick="ativaedesativa2()"]').double_click
  find('a[onclick="ativaedesativa3()"]').right_click
  visit '/'
  click_link('Github')
end
````

## AULA 30 - Interagindo com formulários

- find(elemento).set "campo a preencher"
- find(elemento).send_keys("Campo a preencher")
- fill_in => localize um campo de texto ou área de texto e preencha-o com o texto fornecido o campo pode ser encontrado através do seu nome, idenrtificação ou texto.

Opções:

- wait - Default: capybaradefault_max_wait_time - tempo máximo de espera pra o elemento correspondente ser exibido
- :with - o valor a preecnher - obrigatório
- :fill_options - opçõesespecificas do driver sobre como preencher campos
- :currently_with - a propriedade de valor atual do campo para preencher 
- :multiple - corresponder campos que podem ter vários valores
- id - corresponder campos que correspondem ao atributo ID
- :name - corresponder campos que correspondem ao atributo name
- :placeholder - corresponder campos que correspondem ao atributo name
- :class - correponder campos que corrpondam a(s) classe(s) forncecidas(s)

Pratica:

1 - Criar arquivo cucumber "interagindo_com_form.feature"

````ruby
#language: pt

@interagindo_com_form
Funcionalidade: Interagindo com formularios

Cenario: Realizar cadastro
Quando eu faco cadastro
Entao verifico se fui cadastrado
````

2 - Criar arquivo de steps "interagindo_com_form.rb"

````ruby
Quando("eu faco cadastro") do
  visit '/users/new'
  fill_in(id: 'user_name', with: "Emerson")
  find('#user_lastname').set("Pereira")
  find('#user_email').send_keys('teste@teste.com.br')
  fill_in(id: 'user_address', with: "Rua 1234")
  find('#user_university').set("UNIB")
  find('#user_profile').send_keys('QA')
  fill_in(id: 'user_gender', with: "masculino")
  find('#user_age').set("30")
  find('input[value="Criar"]').click
end

Entao("verifico se fui cadastrado") do
  texto = find('#notice')
  expect(texto.text).to eql 'Usuário Criado com sucesso'
end
````

## AULA 31 - Dropdown, select e autocomplete

Dropdown e Select 

find(elemento).click
select => encontra uma caixa de seleção na página e seleciona uma opção específica dela
unselect => encontre uma caixa de seleção na página e desmargue uma opção especifica dela
select_option > seleciona uma opção especifica dela

Pratica:

1 - Criar arquivo cucumber "combobox_dropdown_autocomplete.feature"

````ruby
#language: pt

@combobox_dropdown_autocomplete
Funcionalidade: Interagindo com dropdown, select e autocomplete

Cenario: Interagir com dropdown e select
Quando interajo com dropdown e select

Cenario: Preencher autocomplete
Quando preencho o autocomplete
````

2 - Criar arquivo de steps "combobox_dropdown_autocomplete.rb"

````ruby
Quando("interajo com dropdown e select") do
  visit '/buscaelementos/dropdowneselect'
  # dropdown por click
  find('.btn.dropdown-button').click
  find('#dropdown3').click
  # select - modo 1
  select 'Chrome', from: 'dropdown'
  # select - modo 2
  find('option[value="2"]').select_option
end

Quando("preencho o autocomplete") do
  visit '/widgets/autocomplete'
  find('#autocomplete-input').set 'Rio de Janei'
  find('ul', text: 'Rio de Janeiro').click
end
````

## AULA 32 - Radio e Checkbox

- find(elemento).click
- check => Encontre uma caixa de seleção e margue-a como marcado
- choose => encontre um botão de opção e margue-o como marcado
- uncheck => encontre uma ciaxa de seleção e margue a opção desmarcada

Opções:

- ID (String)
- name (string)
- :class (string, array < string >)
- :allow_label_click (boolean)
- wait (false, numeric)

Pratica

1 - Criar arquivo cucumber "radiobox_checkbox.feature"

````ruby
#language: pt

@radiobox_checkbox
Funcionalidade: Marcando radiobox e checkbox

Cenario: Marcar radiobox e checkbox
Quando eu marco um checkbox e um radiobox
````

2 - Criar arquivo de steps "radiobox_checkbox.rb"

````ruby
Quando("eu marco um checkbox e um radiobox") do
  visit '/buscaelementos/radioecheckbox'
  #checkbox modo1
  find('label[for="white"]').click
  #checkbox modo2
  check('purple', allow_label_click: true)
  uncheck('purple', allow_label_click: true)
  #radiobox
  choose('red', allow_label_click: true)
end
````




