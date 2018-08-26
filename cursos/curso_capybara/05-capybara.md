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

## AULA 33 - Verificando elementos visíveis na tela

Esses são os principais:

Assert

- assert_none_of_selector => afirma que nenhum dos seletores fornecidos está presente na página ou nos descendentes do nó atual.
- assert_matches_selector => aforma que o current_node corresponde a um determinado seletor.
- asset_text => afirma que a pagina ou o nó atual possui o conteúdo de texto especificado, ignorando quaisquer tags html.

Matches

- matches_css? => verifica se o nó atual corresponde ao seletor de css especificado
- matches_selector? => verifica se o nó atual corresponde ao seletor especificado
- matches_xpath? => verifica se o nó atual corresponde a determinada expressão xpath

Has

- has-selector? => verifica se a pagina ou o nó atual tem um campo de seleção com o rótulo, o nome ou o id fornecido
- has_table? => verifica se a pagina ou nó atual possui uma tabela com o id ou a legenda especificada
- has_text? => verifica se a página ou o nó atual tem o conteúdo de texto especificado, ignorando todas as tags html
- has_css? => verifica se um determinado seletor de css esta na pagina ou um descendente do nó atual

Mais detalhes: https://www.rubydoc.info/github/jnicklas/capybara/Capybara/Node/Matchers

Rspec Matchers

- have_button => verifica se a pagina ou nó atual possui um botão com o texto, valor ou id fornecido
- have_link => verifica se a pagina ou o nó atual tem um link com o texto ou o id fornecido
- have_text => afirma que a pagina ou o nó atual possui o conteudo de texto especificado, ignorandp quaisquer tags html
- have_title(title,**options) => verifica se um determinado titulo esta na pagina

Mais detalhes: https://www.rubydoc.info/github/jnicklas/capybara/Capybara/RSpecMatchers

Pratica

1 - Criar arquivo cucumber "verificando_elementos_visiveis.feature"

````ruby
#language: pt

@verificando_elementos_visiveis
Funcionalidade: Verificando elementos visiveis na tela

Cenario: Verificar elemento visivel com sucesso
Quando clico no botao
Entao verifico se o texto apareceu na tela com sucesso
````

2 - Criar arquivo de steps "verificando_elementos_visiveis.rb"

````ruby
Entao("verifico se o texto apareceu na tela com sucesso") do
  # exemplo1
  page.assert_text(text, 'Você Clicou no Botão!')
  # exemplo2 
  page.has_text?('Você Clicou no Botão!')
  # exemplo3
  have_text('Você Clicou no Botão!')
end
````

Atenção:

````
Um assert é uma afirmativa que vai gerar um erro quando a afirmativa não é encontrado, dessas três funções somente temos um assert que é page.assert_text , as outras funções não são asserts, elas vão retornar true/encontrado ou false/não encontrar sem causar erro ou teste falho.
````

## AULA 34 - Verificando elementos invisíveis na tela

Esses são os principais:

Assert_not

- assert_notmatches_selector => afirma que o current_node não corresponde a um determinado seletor
- assert_no_selector => afirma que um determinado seletor não esta na pagina ou descendente do nó atual
- assert_no_text => afirma que a pagina ou o nó atual não tem o conteudo de texto especificado, ignorando quaisquer tags html

Not_matches

- not_matches_css => verifica se o nó atual não corresponde ao seletor de css fornecido
- not_matches_selector? => verifica se o nó atual não corresponde ao dado seletor. O uso é identico as has_selector?
- not_matches_xpath? => verifica se o nó atual não corresponde a expressao xpath fornecida


Has_no

- has_no_selector? => verifica se um determinado seletor não esta na pagina ou um descendente di nó atual
- has_no_text? => verifica se a pagina ou o nó atual não possui o conteudo de texto especificado, ignorando qualquer tag html e normalizando o espaçõ em branco.
- has_no_css? => verifica se um determinado seletor de css não esta na pagina ou um descendente do nó atual

Pratica:

1 - Criar arquivo cucumber "verificando_elementos_invisiveis.feature"

````ruby
#language: pt

@verificando_elementos_visiveis
Funcionalidade: Verificando elementos visiveis na tela

Cenario: Verificar elemento visivel com sucesso
Quando clico em um botao
Entao verifico se o texto desapareceu na tela com sucesso
````

2 - Criar arquivo de steps "verificando_elementos_invisiveis.rb"

````ruby
Quando("clico em um botao") do
  visit '/buscaelementos/botoes'
  find('#teste').click
end

Entao("verifico se o texto desapareceu na tela com sucesso") do
  page.assert_text(text, 'Você Clicou no Botão!')
  page.has_text?('Você Clicou no Botão!')
  have_text('Você Clicou no Botão!')

  find('#teste').click

  assert_no_text(text, 'Você Clicou no Botão!')
  have_no_text?('Você Clicou no Botão!')
end
````

## AULA 35 - Trabalhando Mouse Hover

- find(elemento).hover - move o mouse ate o elemento mapeado
- find(elemento).hover.click - move o mouse até o elemento mapeado e depois clica

Pratica:

1 - Criar arquivo cucumber "mouse_hover.feature"

````ruby
#language: pt

@mouse_hover
Funcionalidade: Usando mouse hover

Cenario: Selecionar mouse hover
Quando seleciono o mouse hover 
````

2 - Criar arquivo de steps "mouse_hover.rb"

````ruby
Quando("seleciono o mouse hover") do
  visit '/iteracoes/mousehover'
  find('.activator').hover
  find('.activator').hover.click
end
````

## AULA 36 - Iframe e Modal

- Muda o foco para o elemento mapeado

````ruby
within(elemento) do
end
````

- Muda o foco para o Iframe

````ruby
within_frame(elemento) do
end
````

Outros tipos:

- Execute o bloco dados dentro de um determinado fielset dado o id ou legenda daquele fieldset

````ruby
within_fieldset(elemento) do
end
````

- Execute o bloco dado dentro de uma tabela especifica, dado o id ou legenda dessa tabela

````ruby
within_table(elemento) do
end
````

Pratica

1 - Criar arquivo cucumber "iframe_modal.feature"

````ruby
#language: pt

@iframe_modal
Funcionalidade: Utilizando iframe e modal

Cenario: Usando iframe
Quando entro no iframe e preencho os campos

Cenario: Usando modal
Quando entro no modal e verifico o texto
````

2 - Criar arquivo de steps "iframe_modal.rb"

````ruby
Quando("entro no iframe e preencho os campos") do
  visit '/mudancadefoco/iframe'
  # mudando o foco para o iframe
  within_frame('id_do_iframe') do
    fill_in(id: 'first_name', with: 'Emerson')
    fill_in(id: 'last_name', with: 'Pereira')
  end
end

Quando("entro no modal e verifico o texto") do
  visit '/mudancadefoco/modal'
  find('a[href="#modal1"]').click
  
  # mudando o foco para o modal
  within('#modal1') do
    texto = find('h4')
    expect(texto.text).to eq 'Modal Teste'
    find('.modal-close').click
  end
end
````

## AULA 37 - Janela e Alert

Janelas

- within_windw - alterna a janela fornecida, executa o bloco, troca de volta
- switch_to_window - obter a janela que foi aberta pelo bloco passado
- current_window - retorna a janela atual
- open_new_window - abre nova janela
- windows - obter todas as janelas abertas

Opções

- resize_to 800, 600 - aumenta o tamanho da tela com o tamanho desejado
- .close - fecha uma janela
- .maximize - maximiza uma janela
- .size - obtenha o tamanho da janela
- .current? - se esta janela é a janela na qual os comandos estão sendo executados
- .closed? - verifica se a janela esta fechada
- .exists? - se a janela nao esta fechada

Pratica

1 - Criar arquivo cucumber "janelas_alertas.feature"

````ruby
#language: pt

@janelas_alertas
Funcionalidade: Interagindo com janelas e alerts

Cenario: Usando janelas
Quando eu entro na janela e verifico a mensagem

Cenario: Usando alerts
Quando eu entro no alerts e verifico faco a acao
````

2 - Criar arquivo de steps "janelas_alertas.rb"

``
Modo 1
``

````ruby
Quando("eu entro na janela e verifico a mensagem") do
  visit '/mudancadefoco/janela'

  # recebe uma janela que foi aberta pelo link
  janela = window_opened_by do
    click_link 'Clique aqui'
  end
  # muda de foco para a janela
  within_window janela do
    # valida se estamos na url da nova aba
    expect(current_url).to eq 'https://automacaocombatista.herokuapp.com/mudancadefoco/newwindow'
    # valido texto da aba aberta
    @mensagem = find('.red-text.text-darken-1.center')
    expect(@mensagem.text).to eq 'Você Abriu uma nova janela!!' 
    # fecha a aba aberta
    janela.close
  end
end
````

``
Modo 2
``

````ruby
Quando("eu entro na janela e verifico a mensagem") do
  visit '/mudancadefoco/janela'

  click_link 'Clique aqui'
  # muda para ultima aba
  switch_to_window windows.last
  # valida se acessou a aba
  expect(current_url).to eq 'https://automacaocombatista.herokuapp.com/mudancadefoco/newwindow'
  @mensagem = find('.red-text.text-darken-1.center')
  expect(@mensagem.text).to eq 'Você Abriu uma nova janela!!' 
  # fecha aba
  windows.last.close
end
````

Alert

- accept_alert - execute o bloco, aceitando um alerta
- accept_confirm - execute o bloco, aceitando uma confirmação
- dismiss_confirm - execute o bloco, dispensando uma confirmação
- accept_prompt - execute o bloco, aceitando um prompt, respondendo opcionalmente ao prompt
- dismiss_prompt - execute o bloco, dispensando um prompt

3 - Continue no segundo step arquivo de  "janelas_alertas.rb"

````ruby
Quando("eu entro no alerts e verifico faco a acao") do
  visit '/mudancadefoco/alert'

  # confirma opção
  find('button[onclick="jsAlert()"]').click
  page.accept_alert 

  # cancela opção   
  # caso queira aceitar usar "accept_confirm"
  find('button[onclick="jsConfirm()"]').click
  page.dismiss_confirm

  # confirma ação e preenche campo
  # caso queira cancela usar "dismiss_prompt"
  find('button[onclick="jsPrompt()"]').click
  page.accept_prompt(with: 'Emerson')
end
````

## AULA 38 - Upload de Arquivo

- attach_file(elemento, caminho do arquivo, opcoes) => encontre o campo de arquivo na pagina e anexe um arquivo dado seu caminho

Opções:

- wait - default: capybara.default_max_wait_time - tempo maximo para agurdar a exibicao do elemento corresponde
- match - default: capybara.match - a estrategia de correspondencia a ser usada (:one, :first, :prefer_exact, :smart)
- exact - default: capybara.exact - corresponde ao nome / conteúdo do rótulo ou aceita uma correspondência parcial
- multiple - campo de correspondencia que permite a selecao de varios arquivos
- id - corresponde a campos com o atributo id
- name - campos com atributos name
- :class - campos que correspondam a classes fornecidas
- make_visible - um hash de estilhos css para alterar antes de tentar anexar o arquivo, se 'true' {opacity: 1, display: 'block', visibilidade: 'visible'} (pode não ser suportado por todos os drivers)

Pratica

1 - Criar arquivo cucumber "upload_de_arquivo.feature"

````ruby
#language: pt

@upload_de_arquivo
Funcionalidade: Upload de arquivo

Cenario: Fazer upload de uma foto
Quando eu faco um upload de arquivo
````

2 - Inclua uma imagem no projeto em seguida no terminal digite "pwd" pra gerar o caminho

````
╰─➤  pwd
../workspace/cursos/all_courses/curso_capybara/05-capybara
````

3 - Criar arquivo de steps "upload_de_arquivo.rb"

````ruby
Quando("eu faco um upload de arquivo") do
  visit '/outros/uploaddearquivos'
  # modo 1 passando todo caminho
  # attach_file('upload', '<incluir caminho da maquina>/features/download.png', make_visible: true)

  # modo 2 passando todo caminho, concatenando o path com metodo Dir
  @image = File.join(Dir.pwd, 'features/download.png')
  attach_file('upload', @image, make_visible: true)
end
````

## AULA 39 - Executando scripts

Execute o script fornecido, não retornando um resultado, isso é util para scripts que retornam objetos complexos, como instruções JQuery

Exemplo:

- page.execute_script("window.scrollby(0,500);")

- result = page.evaluete_script('4 + 4')

Pratica:

1 - Criar arquivo cucumber "script.feature"

````ruby
#language: pt

@script
Funcionalidade: Usando script

Cenario: Usar script
Quando eu uso script
````

2 - Criar arquivo de steps "script.rb"

````ruby
Quando("eu uso script") do
  visit '/outros/scroll'
  page.execute_script("window.scrollBy(0,1500)")

  @result = page.evaluate_script('4 + 4');
  puts "O resultado do JQuery é #{@result}"
end
````

## AULA 40 - Usando teclado

- element.send_keys(teclas)

Pratica

1 - Criar arquivo cucumber "usando_teclado.feature"

````ruby
#language: pt

@usando_teclado
Funcionalidade: Usando teclado

Cenario: Usar teclado
Quando realizo acoes com o teclado
````

2 - Criar arquivo de steps "usando_teclado.rb"

````ruby
Quando("realizo acoes com o teclado") do
  visit '/users/new'
  find('#user_name').send_keys(:page_down)
  find('input[value="Criar"]').send_keys(:enter)
end
````

## AULA 41 - Drag and Drop

- elemento1 = page.find('#winston')
- elemento2 = page.find('#dropzone')
- elemento1.drag_to('@elemento2')

Pratica

1 - Criar arquivo cucumber "drag_and_drop.feature"

````ruby
#language: pt

@drag_and_drop
Funcionalidade: Usando Drag and Drop

Cenario: Usar Drag and Drop

Dado que eu estou na tela de drag_and_drop
Quando movo o dragdrop
````

2 - Criar arquivo de steps "drag_and_drop.rb"

````ruby
Dado("que eu estou na tela de drag_and_drop") do
  visit '/iteracoes/draganddrop'
end

Quando("movo o dragdrop") do
  @primeiro_elemento = find('#winston')
  @segundo_elemento = find('#dropzone')
  @primeiro_elemento.drag_to(@segundo_elemento)
end
````

## AULA 42 - End to End

Consiste em rodar todos os testes sem a necessidade de resetar sessão para cada cenário que for finalizado

``
A gem cucumber acaba resetando a sessão a cada cenario, para não resetar a sessão a cada cenario executado é necessario mudar o arquivo env.rb da forma mencionada abaixo.
``

````ruby
#require 'capybara/cucumber'
require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec/matchers'

World(Capybara::DSL)
World(Capybara::RSpecMatchers)
````

``
Então quando é necessario fazer com que um cenario dependa de outro, deve usar como o exemplo acima, chamando direto a gems do capybara/dsl e capybara/rspec/matches, e informar colocar como global.
``
Pratica

1 - Criar arquivo cucumber "end_to_end.feature"

````ruby
#language: pt

@end_to_end
Funcionalidade: Criar usuario

Cenario: Criar cadastro om sucesso
Quando eu cadastro o usuario
Entao verifico se o usuario foi cadastrado

Cenario: Editar com sucesso
Quando edito um usuario
Entao verifico se o usuario foi editado
````

2 - Criar arquivo de steps "end_to_end.rb"

````ruby
Quando("eu cadastro o usuario.") do
  visit '/users/new'
  fill_in(id: 'user_name', with: "teste")
  find('#user_lastname').set("teste")
  find('#user_email').send_keys('teste@teste.com.br')
  find('input[value="Criar"]').click
end

Entao("verifico se o usuario foi cadastrado.") do
  texto = find('#notice')
  expect(texto.text).to eq 'Usuário Criado com sucesso'
end

Quando("edito um usuario.") do
  find('.btn.waves-light.blue').click
end

Entao("verifico se o usuario foi editado.") do

end
````

``
Para este cenario alterar arquivo env.rb
``