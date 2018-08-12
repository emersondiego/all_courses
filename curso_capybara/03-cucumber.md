# Curso de Automação de Testes com Capybara, Cucumber e Ruby

## AULA 15 - Primeiro projeto em Cucumber

1 - Instalar gem Cucumber

``
gem install cucumber
``

2 - Instalar gem Rspec

```
É um framework de testes de unidade, assim como o Junit. Porém ele vai além de apenas fornecer um conjunto de métodos para os seus testes, e nos fornece uma DSL para descrever os comportamentos esperados do sistema, ou seja, ao inves, de ter apenas "um monte" de ASSERTS, temos "um monte" de ASSERTS dento de exemplos executaveis, a diferença é sutil, mas faz um boa diferença.
```

Terminal:

```
gem install rspec
```

3- Criando Projeto

Teminal:

```
- criar pasta raiz "tests" (mkdir)

- cucumber --init
      ╰─➤  cucumber --init
      create   features
      create   features/step_definitions
      create   features/support
      create   features/support/env.rb

    tests - pasta raiz do projeto
    specs - pasta onde fica os arquivos features (pasta que precisa ser criada)
    step_definitions - pasta onde são executados os testes
    support - psta onde fica as config
    env.rb - nosso arquivo de configuração
    Gemfile - onde fica as dependencias do projeto - criar

- dentro da pasta features criar uma pasta chamda "specs"
```

4 - Informar gems no arquivo Gemfile

5 - Instalar com comando bundle install

6 - Criar dentro de specs

``
arquivo <primeiro_cenario.feature>
``

7 - Para o arquivo .feature reconheça a lingua passar #language: pt no começo do arquivo

8 - Preencher primeiro cenário no arquivo <primeiro_cenario.feature>

```ruby
#language: pt

Funcionalidade: Fazer uma soma.

-Eu como usuario
-quero fazer uma soma

Cenario: Fazer uma soma
Quando somo 2 + 2
Então o resltado é 4
```

9 - Abrir terminar e digitar "cucumber"

Saida terminal:

```ruby
╰─➤  cucumber
# language: pt
Funcionalidade: Fazer uma soma.
-Eu como usuario
-quero fazer uma soma

Cenario: Fazer uma soma # features/specs/primeiro_cenario.feature:8
    Quando somo 2 + 2     # features/specs/primeiro_cenario.feature:9
Então o resltado é 4  # features/specs/primeiro_cenario.feature:10

1 scenario (1 undefined)
2 steps (2 undefined)
0m0.092s

You can implement step definitions for undefined steps with these snippets:

Quando("somo {int} + {int}") do |int, int2|
    pending # Write code here that turns the phrase above into concrete actions
end

Então("o resultado é {int}") do |int|
    pending # Write code here that turns the phrase above into concrete actions
end
```

9 - Criar um novo arquivo em step_definitions chamado primeiro_cenario.rb

10 - Incluir dentro do arquivos primeiro_cenario.rb metodos criados no comando cucumber:

```ruby
Quando("somo {int} + {int}") do |int, int2|
    pending # Write code here that turns the phrase above into concrete actions
end

Então("o resultado é {int}") do |int|
    pending # Write code here that turns the phrase above into concrete actions
end
```

11 - Criar a logica do step dentro do metodo na linha onde estão como "pending"

Arquivo:

```ruby
Quando("somo {int} + {int}") do |valor1, valor2|
    @soma = valor1 + valor2
end

Então("o resultado é {int}") do |resultado|
    expect(@soma).to eq(resultado)
end
```

12 - Run test

```
Executar comando 'cucumber'
```

Saida terminal:

```ruby
╰─➤  cucumber
# language: pt
Funcionalidade: Fazer uma soma.
-Eu como usuario
-quero fazer uma soma

Cenario: Fazer uma soma # features/specs/primeiro_cenario.feature:8
    Quando somo 2 + 2     # features/step_definitions/primeiro_cenario.rb:1
    Então o resultado é 4 # features/step_definitions/primeiro_cenario.rb:5

1 scenario (1 passed)
2 steps (2 passed)
0m0.091s
```

## AULA 16 - Trabalhando com cenários

1 - CENÁRIO

  Os cenários do cucumber consistem em etapas, também conhecidas como GIVENS (Dado), WHEN (Quando) e THENS (Então).
  Cucumber não distigngue tecnicamente esses três tipos de etapas, no entanto, recomendamos que voçê faça isso! Essas palavras foram cuidadosamente selecionadas para seu propósito, e voÇê deve saber qual é o propósito de entrar na mentalidade do BDD.

Dado

```
A finalidade dos dados é colocar o sistema em um estado conhecido antes que o usuario (ou sistema externo) inicie a interação com o sistema (nas etapas quando). Evite falar sobre interação do usuario em Dados. Se voçê estivesse criando casos de uso, os dados seriam suas pré-condições.
```

Quando

```
Objetivo de When Steps é descrever a ação-chave que o usuario realiza (ou, usando a metáfora de Robert C. Martin, a transição de estado).
```

Então

```
ENTÃO é observar os resultados. As observações devem estar relacionadas ao valor / beneficio do negócio na descrição do seu recurso. As observações também devem estar em algum tipo de saída - que é algo que vem de fora do sistema (relatórios, interface de usuario, mensagens) e não algo que está profundamente enterrado dentro dela (que não tem valor comercial)
```

E, MAS.

```
Para as etapas de cucumber que começam com E ou MAS s"ao exatamente o mesmo tipo de etapas que todas as outras.
```

EXEMPLO:

1 - Criar um novo arquivo em novo projeto tests na pasta specs chamado cenario.feature

```ruby
#language: pt

Funcionalidade: Calculo de Subtração e Soma

Cenario: Fazer uma subtração
Dado eu tenha 10 laranjas.
Quando eu como 2 laranjas.
Então eu vejo quantas laranjas sobraram.
```

ALERTA

`
Dentro do arquivo feature não misturar funcionalidades! Pode ter varios cenários, mas apenas uma funcionalidade
`

2 - Executar comando "cucumber" no terminal, extrair steps criados e criar novo arquivo em step_definitions com nome de cenario.rb

3 - Criar logica para cada step criado.

```ruby
Dado("eu tenha {int} laranjas.") do |valor1|
    puts "Tenho #{valor1}"
    @laranjas = valor1
end

Quando("eu como {int} laranjas.") do |valor2|
    puts "Comi #{valor2}"
    @comer = valor2
    @resultados = @laranjas - @comer
end

Então("eu vejo quantas laranjas sobraram.") do
    puts "Ainda tenho #{@resultados}"
    expect(@resultados).to eq(8)
end
```

Curiosidade

``
Os testes sempre rodam pelo comando cucumber por ordem alfabetica
Exemplo: primeiro: a.feature, depois b.feature e assim por diante
``

4 - Criando o segundo cenário dentro do arquivo cenario.feature

```
Cenario: Fazer uma soma
Dado eu tenha 10 laranjas.
Quando eu compro 5 laranjas.
Então eu vejo quantas laranjas tenho.
```

5 - Rodar comando cucumber no terminal e copiar metodos criados para criar logica

Importante saber:

``
Vai ser gerado apenas dois metodos, pois um dos metodos ja existe dessa forma o cucumber ira reutilizar essa ação.
Isso ocorre pois os nomes dos steps são iguais.
``

```ruby
Quando("eu compro {int} laranjas.") do |valor3|
  puts "Tenho #{valor3}"
  @comprar = valor3
  @compra_total = @laranjas + @comprar
end

Então("eu vejo quantas laranjas tenho.") do
  expect(@compra_total).to eq (15)
  puts "Comprei  ao todo #{@compra_total} laranjas"
end
```

## AULA 17 - Esquema de Cenário

Esquema de cenáro nos permite rodas vários cenários com  a mesma funcionalidade que onde apenas mudam o valor
Um esquema decenário é formado por uma tabela e <> (parametros delemitados)
Um esquema de cenário forncem um modelo que nunca é executado diretamente. Um esquema do cenário é executado uma vez para cada linha na seção de exemplos abaixo dela (exceto para a primeira linha que é o cabeçalho)

Exemplo:

```ruby
Esquema de Cenário: Comer
dados que eu tenho um a <quantidade> de pepinos.
Quando eu <como> pepinos.
Então eu deveria ter <sobrado> pepinos

Tabela:

| quantidade | como | sobrado |
|12          |5     |7        |
|20          |5     |15       |
```


1 - Criar arquivo em tests/features/specs chamados "esquema_do_cenario.feature"

```ruby
#language: pt

Funcionalidade: Calculo de Multiplicação

Esquema do Cenario: Fazer uma multiplicação

Quando multiplico minhas <laranjas> pelo <valor>
Então vejo qual é o <resultado> da multiplicação.

Exemplos:

| laranjas | valor | resultado |
|10        |2      |20         |
|10        |3      |30         |
|10        |4      |40         |
|10        |5      |50         |
```

2 - Rodar comando "cucumber" no terminal copiar metodos "steps" para o arquivo "esquema_do_cenario.rb" em step_definitions e criar logica.

```ruby
Quando("multiplico minhas {int} pelo {int}") do |laranjas, valor|
  @multiplicacao = laranjas * valor
end

Então("vejo qual é o {int} da multiplicação.") do |resultado|
  expect(@multiplicacao).to eq resultado
end
```

Saida Terminal:

```ruby
╰─➤  cucumber features/specs/esquema_do_cenario.feature
# language: pt
Funcionalidade: Calculo de Multiplicação

Esquema do Cenario: Fazer uma multiplicação         # features/specs/esquema_do_cenario.feature:5
  Quando multiplico minhas <laranjas> pelo <valor>  # features/specs/esquema_do_cenario.feature:7
  Então vejo qual é o <resultado> da multiplicação. # features/specs/esquema_do_cenario.feature:8

  Exemplos:
    | laranjas | valor | resultado |
    | 10       | 2     | 20        |
    | 10       | 3     | 30        |
    | 10       | 4     | 40        |
    | 10       | 5     | 50        |

4 scenarios (4 passed)
8 steps (8 passed)
0m0.054s
```

## AULA 18 - Contexto

Permite você adicionar algum contexto a todos os cenários em um único recurso. Um contexto é como um cenário sem título, que contém uma série de etapas. A diferença ocorre quando ele é executado. O contexto será executado antes de cada um de seus cenários.

```
Contexto:
Dado que eu tenho 10 laranjas

Cenario: Comprar laranja
Quando eu compro 2 laranjas
Então eu verifico se o total de laranjas é 12
```

Pratica

1 - Criar arquivo em tests/features/specs chamados "contexto.feature"

```ruby
#language: pt

Funcionalidade: Trabalhando com contexto

Contexto:
Dado que eu tenho 10 laranjas na bolsa

Cenario: Colocar quantidade de laranja
Quando eu coloco 2 laranjas na bolsa.
Então verifico o total de laranjas é 12.

Cenario: Retirar quantidades de laranjas laranja
Quando tiro 2 laranjas da bolsa
Então vejo quantas laranjas fiquei na bolsa
```

2 - Rodar comando "cucumber" no terminal copiar metodos "steps" para o arquivo "contexto.rb" em step_definitions e criar logica.

```ruby
Dado("que eu tenho {int} laranjas na bolsa") do |valor|
  @laranjas = valor
end

Quando("eu coloco {int} laranjas na bolsa.") do |valor2|
  @coloquei = valor2
  @resultado = @laranjas + @coloquei
end

Então("verifico o total de laranjas é {int}.") do |total|
  expect(@resultado).to eq total
end

Quando("tiro {int} laranjas da bolsa") do |valor3|
  @retirei = valor3
  @resultado = @laranjas - @retirei
end

Então("vejo quantas laranjas fiquei na bolsa") do
  expect(@resultado).to eq 8
end
```

Saida Terminal:

```ruby
╰─➤  cucumber features/specs/contexto.feature                                                                 1 ↵
# language: pt
Funcionalidade: Trabalhando com contexto
  Contexto:                                # features/specs/contexto.feature:5
  Dado que eu tenho 10 laranjas na bolsa # features/step_definitions/contexto.rb:1

  Cenario: Colocar quantidade de laranja     # features/specs/contexto.feature:8
  Quando eu coloco 2 laranjas na bolsa.    # features/step_definitions/contexto.rb:5
  Então verifico o total de laranjas é 12. # features/step_definitions/contexto.rb:10

  Cenario: Retirar quantidades de laranjas laranja # features/specs/contexto.feature:12
  Quando tiro 2 laranjas da bolsa                # features/step_definitions/contexto.rb:14
  Então vejo quantas laranjas fiquei na bolsa    # features/step_definitions/contexto.rb:19

2 scenarios (2 passed)
6 steps (6 passed)
0m0.106s
```

## AULA 19 - Data Table (tabelas)

  As tabelas são etapas de argumentos útes para a especificação de um grande conjunto de dados - normalmente como entrada para uma saida de dado ou como espera de um então.
  Não confunda tabelas com ESQUEMA DE CENARIO - sintaricamente eles são idênticos, mas eles tem propósitos difenretes. Esquemas declaram diferentes valores múltiplos ao mesmo cenário, enquanto tabelas são usadas para esperar um conjunto dados.

Existem dois tipos:

  Exemplo 1

```ruby
CENARIO: DATATABLE COM COLUNAS
DADO QUE AS SEGUINTES PESSOAS EXISTEM:
|NOME   |EMAIL            |FONE |
|ASLAK  |ASLAK@RMAIL.COM  |123  |
|JOE    |JOE@EMAIL.COM    |234  |
|BRYAN  |BRYAN@EMAIL.ORG  |456  |
```

Exemplo 2

```ruby
Cenario: Dados de usuários
Dado que as seguintes pessoas existem:
|nome | Aslak            | Joe            |
|email| aslak@email.com  | joe@email.com  |
|fone | 123              | 1234.          |
```


Pratica:

1 - Criar arquivo em tests/features/specs chamados "datatable.feature"

```ruby
#language: pt

Funcionalidade: Trabalhando com Datatable

Cenario: Cortar laranja
Dado que tenho umas laranjas
|laranja|10|
Quando corto duas laranjas 
Então verifico  quantas laranjas sobraram inteiras

Cenario: Chupar laranja
Dado que tenho umas laranjas
|laranja|
|10     |
Quando chupo 2 laranjas
Então verifico quantas laranjas sobraram
```

2 - Rodar comando "cucumber" no terminal copiar metodos "steps" para o arquivo "datatable.rb" em step_definitions e criar logica.

```ruby
# em linhas begin #

Dado("que eu tenho umas laranjas") do |table|
  @laranja = table.rows_hash['laranja'].to_i
end

Quando("corto {int} laranjas") do |valor1|
  @cortar = valor1
  @total = @laranja - @cortar
end

Então("verifico  quantas laranjas sobraram inteiras") do
  expect(@total).to eq 8
end

# em linhas end #
```

```ruby
# em colunas begin #

Dado("eu que tenho umas laranjas") do |table|
  table.hashes.each do |valor|
    @laranjas = valor["laranja"].to_i
  end
end

Quando("chupo {int} laranjas") do |valor2|
  @chupei = valor2
  @resultado = @laranjas - @chupei
end

Então("verifico quantas laranjas sobraram") do
  expect(@resultado).to eq 8
end
# em colunas end #
```

Dica:

``
Datatable com linha é usado o "rows_hash" pra pegar o header da coluna que a gente quer.
Datatable usando coluna pega o "hashes.each" pra pegar as colunas com os seus header
``

## AULA 20 - Chamando outros steps

  Invocar etapas das defini'ões de etapa é prático se você tiver várias etapas comuns que deseja executar em vários cenários, Ou simplesmente se você quiser tornar seus cenários mais declarativos. Isso permite que voc6e faça isso em um cenário.

Exemplo:

```ruby
Dados ("Que tenho laranjas") do
  steps %Q{
    Quando euw tehho 10 laranjas
  }
end
```

Prática: 

1 - Criar arquivo em tests/features/specs chamados "chamando_steps.feature"

```ruby    

Funcionalidade: Trabalhando chamandos outros passos

Cenario: Amasso laranjas
Dado eu tenho 10 laranjas no estoque.
Quando eu amasso 2 laranjas
Entao eu verifico quantas laranjas sobraram no estoque

Cenario: Revendo laranjas
Quando revendo 2 laranjas
Entao eu verifico com quantas laranhas eu fiquei. 
```

2 - Rodar comando "cucumber" no terminal copiar metodos "steps" para o arquivo "chamando_steps.rb" em step_definitions e criar logica.

```ruby
Dado("eu tenho {int} laranjas no estoque.") do |valor1|
  @laranjas = valor1
end

Quando("eu amasso {int} laranjas") do |amassei|
  @total = @laranjas - amassei
end

Entao("eu verifico quantas laranjas sobraram no estoque") do
  expect(@total).to eq 8
end

Quando("revendo {int} laranjas") do |valor2|
  # neste step não existe a quantidde de laranjas que existe no estoque,
  # dessa forma vamos utilizar a funnção chamando steps
  steps %Q{
    Dado eu tenho 10 laranjas no estoque.
  }
  @resultado = @laranjas - valor2
end

Entao("eu verifico com quantas laranjas eu fiquei.") do
  expect(@resultado).to eq 8
end
```

## AULA 21 - Tags

```
As tags são uma ótima maneira de organizar seus recursos e cenários.
```

Exemplo

```ruby
@important
Funcionalidade: Verificar Faturamento
Cenario: Descrição do produto ausente

Cenario: Vários produtos
```

``
Um cenário ou funcionalidade pode possuir varias tags
``

Exevutando as tags:

```
cucumber --tags @important
cucumber --tags @important, ~@second - não rode os testes com tags second
cucumber --t @important, @second, @third
```

Pratica:

1 - Criar arquivo em tests/features/specs chamados "tags.feature"

```ruby
#language: pt

@funcional
Funcionalidade: Calculo de Subtração e Soma

@tag_cenario
Cenario: Fazer uma subtração
Dado eu tenha 10 laranjas.
Quando eu como 2 laranjas. 
Então eu vejo quantas laranjas sobraram.

Cenario: Fazer uma soma
Dado eu tenha 10 laranjas.
Quando eu compro 5 laranjas. 
Então eu vejo quantas laranjas tenho.
```

Chamando apenas @tag_cenario

Saida terminal:

```ruby
╰─➤  cucumber --tags @tag_cenario
# language: pt
@funcional
Funcionalidade: Calculo de Subtração e Soma

  @tag_cenario
  Cenario: Fazer uma subtração               # features/specs/tags.feature:7
    Dado eu tenha 10 laranjas.               # features/step_definitions/cenario.rb:1
      Tenho 10
    Quando eu como 2 laranjas.               # features/step_definitions/cenario.rb:6
      Comi 2
    Então eu vejo quantas laranjas sobraram. # features/step_definitions/cenario.rb:12
      Ainda tenho 8

1 scenario (1 passed)
3 steps (3 passed)
0m0.030s
```

Chamando apenas @funcional

```
╰─➤  cucumber --tags @funcional 
# language: pt
@funcional
Funcionalidade: Calculo de Subtração e Soma

  @tag_cenario
  Cenario: Fazer uma subtração               # features/specs/tags.feature:7
    Dado eu tenha 10 laranjas.               # features/step_definitions/cenario.rb:1
      Tenho 10
    Quando eu como 2 laranjas.               # features/step_definitions/cenario.rb:6
      Comi 2
    Então eu vejo quantas laranjas sobraram. # features/step_definitions/cenario.rb:12
      Ainda tenho 8

  Cenario: Fazer uma soma                 # features/specs/tags.feature:12
    Dado eu tenha 10 laranjas.            # features/step_definitions/cenario.rb:1
      Tenho 10
    Quando eu compro 5 laranjas.          # features/step_definitions/cenario.rb:17
      Tenho 5
    Então eu vejo quantas laranjas tenho. # features/step_definitions/cenario.rb:24
      Comprei ao todo 15 laranjas

2 scenarios (2 passed)
6 steps (6 passed)
0m0.033s
```

## AULA 22 - Hooks

```
Cucumber fornece um numero de hooks que nos permitem executar blocos em vários pontos no ciclo de teste do cucumber. Voc6e pode colocá-los em seu SUPPORT/ENV.RB arquivo ou qualquer outro arquivo no diretorio, por exemplo, em um arquivo chamado SUPPORT/HOOKS.RB. Não há associação entre onde o hook é definido e para qual cenário / Etapa ele é executado, mas você pode usar hooks marcadas se quiser um controle mais refinado.
```
After
```
After hooks serào executados após a ultima etapa de cada cenário, mesmo quando houver etapas com falha, indedinida, pendente ou iganorada. Eles serão executados na ordem inversa na qual estão registrados.
```
Before
```
Before hooks serão executados antes do primeiro passo de cada canário. Eles serão executados na mesma ordem em que estão registrados.
```

Diferença entre Contexto e Hooks

``
Contexto roda antes de cada cenario dentro da funcionalidade que ele esta
Hooks roda antes ou depois de cada cenario do seu projeto inteiro.
``

Hooks com Tags
````
As vezes voce pode querer um certo gancho para executar apenas para determinados cenários. Isto pode ser inserido atraves da associação a Before, After, Around ou Afterstep Hooks com uma ou maus tags.
````

Pratica

1 - Criar arquivo em tests/features/specs chamados "hooks_normal.feature"

```ruby
#language: pt

Funcionalidade: Calculo Media

-Eu como usuario
-Quero fazer uma subtração e uma soma

@comeco @final #sera utilizado no passo 5 em diante
Cenario: Fazer uma media
Quando realizo a media
Então o resultado da media
```

2 - Rodar comando "cucumber" no terminal copiar metodos "steps" para o arquivo "hooks_normal.rb" em step_definitions e criar logica.

```ruby
Quando("realizo a media") do
  @media  = @soma / 2
end

Então("o resultado da media") do
  expect(@media).to eq 5
end
```

3 - Criar arquivos "hooks.rb" em na pasta support

```ruby
before do
  puts "Estou sendo executado antes de cada cenario"
  @soma = 5 + 5
end
```

Saida terminal

```ruby
╰─➤  cucumber features/specs/hooks_normal.feature                                   2 ↵
# language: pt
Funcionalidade: Calculo Media
-Eu como usuario
-Quero fazer uma subtração e uma soma

  Cenario: Fazer uma media     # features/specs/hooks_normal.feature:8
      Estou sendo executado antes de cada cenario
    Quando realizo a media     # features/step_definitions/hooks_normal.rb:1
    Então o resultado da media # features/step_definitions/hooks_normal.rb:5

1 scenario (1 passed)
2 steps (2 passed)
0m0.028s
```

Rodar depois de todos os cenários

4 - Incluir no arquivo hooks.rb o trecho abaixo:

```ruby
After do
  puts "Estou sendo executado depois de cada cenario"
end
```

Saida terminal

```ruby
╰─➤  cucumber features/specs/hooks_normal.feature
# language: pt
Funcionalidade: Calculo Media
-Eu como usuario
-Quero fazer uma subtração e uma soma

  Cenario: Fazer uma media     # features/specs/hooks_normal.feature:8
      Estou sendo executado antes de cada cenario
    Quando realizo a media     # features/step_definitions/hooks_normal.rb:1
    Então o resultado da media # features/step_definitions/hooks_normal.rb:5
      Estou sendo executado depois de cada cenario

1 scenario (1 passed)
2 steps (2 passed)
0m0.031s
```

Atenção

``
Esses dois casos citados acima são chamados de hooks globais
``

Rodando os hooks em terminada funcionalidade ou cenários

5 - Incluir no arquivo hooks.rb o trecho abaixo:

```ruby
Before '@comeco' do
  puts "Rodei apenas no cenario com tag comeco"
end

After '@final' do
  puts "Rodei apenas no cenario com tag final"
end
```

Saida Terminal:

```ruby
╰─➤  cucumber features/specs/hooks_normal.feature
# language: pt
Funcionalidade: Calculo Media
-Eu como usuario
-Quero fazer uma subtração e uma soma

  @comeco @final
  Cenario: Fazer uma media     # features/specs/hooks_normal.feature:9
      Estou sendo executado antes de cada cenario
      Rodei apenas no cenario com tag comeco
    Quando realizo a media     # features/step_definitions/hooks_normal.rb:1
    Então o resultado da media # features/step_definitions/hooks_normal.rb:5
      Rodei apenas no cenario com tag final
      Estou sendo executado depois de cada cenario

1 scenario (1 passed)
2 steps (2 passed)
0m0.032s
```