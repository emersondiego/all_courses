## AULA 54 - Relatórios padrão do cucumber

Relatório: --format html --out=report.html

Pratica:

`pasta: 08-relatorio_cucumber`

1 - Na pasta raiz criar outra chamada 'reports'

1 - Adicionar em nosso cucumber.yml o comando para gerar relatório passando o path da pasta criada

````yml
html: --format html --out=reports/relatorio.html
````

3 - Incluir no default para chamar a configuração para criar relatórios

````yml
default: --profile pretty -p homolog -p chrome -p html
````

Adicionar screenshot

1 - Criar um arquivo de dentro da pasta support chamado "helper.rb"

````ruby
module Helper
  def tirar_foto(nome_arquivo, resultado)
    caminho_arquivo = "results/screenshots/test_#{resultado}"
    foto = "#{caminho_arquivo}/#{nome_arquivo}.png"
    page.save.screenshot(foto)
    embed(foto, 'image/png', 'Clique aqui!')
  end
end
````

- caminho_arquivo = "results/screenshots/test_#{resultado}" => cria a estrutura de pasta, passando criando a pasta test_falhou ou test_passou

- foto = "#{caminho_arquivo}/#{nome_arquivo}.png" => recebe o caminho do arquivo mais o nome da foto

- page.save.screenshot(foto) => metodo que tira foto da tela

- embed(foto, 'image/png', 'Clique aqui!') => adicionar a foto no arquivo html ao clicar no Clique aqui! na pagina

2 - Criar outro arquivo dentro de support chamado hooks.rb

````ruby
After do |scenario|
  scenario_name = scenario.name.gsub(/\s+/,'_').tr('/','_') # tira os espaços utulizando gsub

  if scenario.failed?
    tirar_foto(scenario_name.downcase!, 'falhou') # colocando o nome do cenario em letra minuscula
  else
    tirar_foto(scenario_name.downcase!, 'passou')
  end
end
````

- scenario.name.gsub(/\s+/,'_').tr('/','_') => retorna o nome do cenario e a regex transforma tudo que for espaçõs em '_'

- scenario_name.downcase! => coloca o nome do cenario em letra minuscula

3 - Em nosso env.rb incluir o metodo de tirar foto tornando o global e passar o require_relative

````ruby
require_relative 'helper.rb'

World(Helper)
````

4 - Rodando a aula

````ruby
╰─➤  bundle exec cucumber features/specs/mapeando_elementos.feature                                                 1 ↵
Using the default, pretty, homolog, chrome and html profiles...
# language: pt
@mapeando_elementosFuncionalidade: Mapear elementos

  Cenário: Preecnher cadastro com sucesso # features/specs/mapeando_elementos.feature:6
    Quando preencho o formulario          # features/step_definitions/mapeando_elementos.rb:1

1 scenario (1 passed)
1 step (1 passed)
0m10.354s
````