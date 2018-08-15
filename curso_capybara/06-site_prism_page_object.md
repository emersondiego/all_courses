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
O siteprism permite modelar seções de uma pagina que aparecem em varias paginas ou que aparecem varias vezes em um apagina separadamente das pagainas. Siteprism fornce a classe de section para essa tarefa.
````