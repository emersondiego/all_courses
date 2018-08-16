## AULA 43 - Instalando site_prism e criando page objects

Page Objects

A prosposta desse padrão é de criar um objeto para cada pagina web, e utulizando a boa e velha orientação a objetos, encapsular em casa classe os atributos e métodos, como campos de cada pagina

Instalando site prism 

1 - Adicione a gem no Gemfile
````
gem 'site_prism'
````

2 - Incluir no env.rb o require do site_prism 

````
require 'site_prism'
````

3 - Relaizar o bundle install no projeto para instalar a nova gem

4 - Criar uma pasta dentro de feaures chamada 'pages' (pasta onde vamos criar todos os PageObject)

5 - Criar arquivo dentro de pages "primeiro_object.rb"

Como fazer:

````
class PrimeiraPage < SitePrism::Page

  ## corpo da classe 

end
````

Exemplo:

````ruby
class PrimeiroObject < SitePrism::Page
  #mapear os elementos
  #fazer os metodos (acoes)

  @page = PrimeiroObject.new
  
  @page.elemento.click
  @page.metodo
end
````

## AULA 44 - Acessando o primeiro site

- set_url => mapeia a url
- @page.load => carrega a url que esta mapeada no page objects

Exemplo:

set_url'https://automacaocombatista.herokuapp.com/users/new'

Pratica

1 - Criar arquivo cucumber "acessando_site.feature"

````ruby
#language: pt

@primeira_page
Funcionalidade: Acessar a primeira page

Cenário: Acessar url com sucesso
Quando acesso a url
Entao verifico se estou na pagina inicial
````

2 - Criar o page object "pagina_inical_page.rb" na pasta pages

````ruby
class PaginaInicial < SitePrism::Page
  set_url '/treinamento/home'
end
````

Atenção 

``
set_url é usado para cada page object, não pode ser incluido mais de uma no mesmo PO.
``

3 - Criar arquivo "acessando_site.rb" na pasta steps

````ruby
Quando("acesso a url") do
  @home = PaginaInicial.new
  @home.load
end

Entao("verifico se estou na pagina inicial") do
  expect(page).to have_current_path('https://automacaocombatista.herokuapp.com/treinamento/home', url: true)
end
````

Dica:

``
Rodar comando no terminal ╰─➤  bundle exec cucumber roda apenas com as gems que estão instaladas no projeto, assim evita conflitos de gems
``

## AULA 45 - Mapeando elementos

- elemento :nome_do_elemento, 'elemento_mapeado'

- element :name, '#id_name'

- element :email, :xpath, 'input[@id="email_id"]''


Pratica:

1 - Criar arquivo cucumber "mapeando_elementos.feature"

````ruby
#language: pt

@mapeando_elementos
Funcionalidade: Mapear elementos

Cenário: Preecnher cadastro com sucesso
Quando preencho o formulario
````

2 - Criar o page object "mapeando_elementos_page.rb" na pasta pages

````ruby
class MapeandoElementoPage < SitePrism::Page
  set_url '/users/new'

  element :nome , '#user_name'

  def preencher
    nome.set 'Testando'
  end
end
````

3 - Criar arquivo "mapeando_elementos.rb" na pasta steps

````ruby
Quando("preencho o formulario") do
  @mapeando = MapeandoElementoPage.new
  @mapeando.load
  @mapeando.preencher
end
````

4 - Para rodar `bundle exec cucumber -t@mapeando_elementos`

Saida terminal:

````ruby
╰─➤  bundle exec cucumber -t@mapeando_elementos                                                                                                                                           

# language: pt
@mapeando_elementos
Funcionalidade: Mapear elementos

  Cenário: Preecnher cadastro com sucesso # features/specs/mapeando_elementos.feature:6
      Quando preencho o formulario          # features/step_definitions/mapeando_elementos.rb:1

1 scenario (1 passed)
1 step (1 passed)
0m5.861s
````

## AULA 46 - Mapeando lista de elementos

````
elements :lista, 'elementos_mapeado'

@pagelista.lista.size
@pagelista.lista[0].text
expect(@pagelista.lista.size).to eq 'tamanho da lista'

@pagelista.lista.each do |listas|
  puts listas.text
end
````

Pratica: 

1 - Criar arquivo cucumber "lista_de_elementos.feature"

````ruby
#language: pt

@mapeando_lista_elementos
Funcionalidade: Mapear uma lista de elementos

Cenario: Mapear lista de elementos
Quando mapeio uma tabela
````

2 - Criar o page object "lista_de_elementos_page.rb" na pasta pages

````ruby
class MapeandoListas < SitePrism::Page
  set_url '/buscaelementos/table'

  # para mapear usando o elements
  # cria um array com os dados da tabela
  elements :lista, 'tr > td' 
end
````

3 - Criar arquivo "lista_de_elementos.rb" na pasta steps

````ruby
Quando("mapeio uma tabela") do
  @lista_de_elementos = MapeandoListas.new
  
  @lista_de_elementos.load

  puts @lista_de_elementos.lista.size
  puts @lista_de_elementos.lista[0].text

  expect(@lista_de_elementos.lista.size).to eq 24

  @lista_de_elementos.lista.each do |listas|
    puts listas.text
  end
end
````

## AULA 47 - Trabalhando com Ajax

- wait_for_< elemento > => espera que um elemento esteja presente na pagina
- wait_until_< elemento >_visible => espera um elemento até que ele fique visivel na pagina
- wait_until_< elemento >_invisible => espera que um elemento esteja até ele ficar invisivel na pagina
- has_< elemento > => verifica que o elemento esteja na tela
- has_no_< elemento > => verifica que o elemento não esteja na tela

Pratica

1 - Criar arquivo cucumber "ajax_page.feature"

````ruby
#language: pt

@ajax
Funcionalidade: Trabalhar com ajax

Cenario: Verificar texto
Quando clico no botao
Quando verifico se apareceu
````

2 - Criar o page object "ajax_page_page.rb" na pasta pages

````ruby
class AjaxPage < SitePrism::Page
  set_url '/buscaelementos/botoes'

  element :botao, '#teste'
  element :mensagem, '#div1'

  def clicar_botao
    wait_for_botao
    botao.click
  end
end
````

3 - Criar arquivo "ajax_page.rb" na pasta steps

````ruby
Quando("clico no botao") do
  @ajax = AjaxPage.new
  @ajax.load
  @ajax.clicar_botao
end

Quando("verifico se apareceu") do
  @ajax.wait_for_mensagem
  expect(@ajax.mensagem.text).to eq ('Você Clicou no Botão!')
end
````

## AULA 48 - Trabalhando com sessões

````
O siteprism permite modelar seções de uma pagina que aparecem em varias paginas ou que aparecem varias vezes em um apagina separadamente das pagainas. Siteprism fornce a classe de section para essa tarefa. Mapear uma coisa que se repete na mesma sessão.
````
Exemplo:

````
# assim mapeia a sessão para icluir no page object

class Sessao < SitePrism::Section
  element :sessao_mapeada, 'elemento'
end
````

Pratica:

1 - Criar arquivo cucumber "sessoes.feature"

````ruby
#language: pt

@sessao
Funcionalidade: Usar Sessao

Cenario: Clicar campo de sessao
Quando clico no elemento da sessao
````

2 - Criar o page object "sessoes_page.rb" na pasta pages

````ruby
class Sessao < SitePrism::Section
  element :youtube, 'a[href="https://www.youtube.com/channel/UCp554v_is_ZzjzSmAQyFfAA"]'
  element :medium, 'a[href="https://medium.com/automa%C3%A7%C3%A3o-com-batista"]'
end

class Pagina < SitePrism::Page
  set_url '/users/new'
  section :navbar, Sessao, '.nav-wrapper'
end
````

- section => nome da função do site_prism
- :navbar => nome que ira rececer para chamar a section
- Sessao =>  nome da classe de onde vem a sessao
- '.nav-wrapper' => mapeamento de elemento

3 - Criar arquivo "sessoes.rb" na pasta steps

````ruby
Quando("clico no elemento da sessao") do
  @pagina = Pagina.new
  @pagina.load
  @pagina.navbar.medium.click
end
````

## AULA 49 - Trabalhando com Iframes

````
Parecido com section

class MyIframe < SitePrism::Page
  element :some_text_field, 'input.username'
end

class PageContainingIframe < SitePrism::Page
  element :my_frame, MyIframe, '#my_iframe_id'
end
````

Pratica:

1 - Criar arquivo cucumber "iframe.feature"

````ruby
#language: pt

@iframe
Funcionalidade: Usar Iframe

Cenario: Preencher campo do iframe
Quando preencho os campos
````

2 - Criar o page object "iframe_page.rb" na pasta pages

````ruby
class PaginaIframe < SitePrism::Page
  element :nome, '#first_name'
  element :sobrenome, '#last_name'
end

class PaginaPadrao < SitePrism::Page
  set_url '/mudancadefoco/iframe'
  iframe :preencher_campos, PaginaIframe, '#id_do_iframe'
end
````

3 - Criar arquivo "iframe.rb" na pasta steps

````ruby
Quando("preencho os campos") do
  @pagina_iframe = PaginaPadrao.new
  @pagina_iframe.load

  @pagina_iframe.preencher_campos do |iframe|
    iframe.nome.set 'Emerson'
    iframe.sobrenome.set 'Pereira'
  end
end
````

## AULA 50 - Melhorando a forma de chamar os Page Object

````
Para não precisar ficar a todo momento instanciando a classe para fazer uso de seus metodos, podemos criar um arquivo helpers que irá nos ajudar com essa tarefa.
````

``
Usando de exemplo arquivos mapeando_elementos
``

1 -Criar arquivo dentro da pasta support cahamdo 'page_helper.rb'


````ruby
Dir[File.join(File.dirname(__FILE__), '../pages/*_page.rb')].each { |file| require file}

module PageObjects
  def mapeando
    @mapeando ||= MapeandoElementoPage.new
  end
end
````

````
Concatena o join com o diretorio que tem o caminho xxx e adiciona na variavel file  
Exemplo: require 'ajax_page.rb'
Ou seja, pega todos os arquivos que termina _page.rb e dar ium require dentro do arquivo helper
````

2 - Incluir dentro de env.rb o modulo como global e incluir o arquivo helper como require_relative

````ruby
require_relative 'page_helper.rb'

World(PageObjects)
````

3 - Alterar arquivo mapeando_elementos.rb, removendo a instancia que era feita dentro dele e chamando de forma mais limpa e clara a classe e metodos, passando pelo page_helper.rb.

````ruby
Quando("preencho o formulario") do
  mapeando.load
  mapeando.preencher
end
````