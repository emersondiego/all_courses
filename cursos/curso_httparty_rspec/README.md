# Curso de Testes automatizados de API com HttParty e Rspec

## Conf. Linux

```
Default 

sudo apt-get update

Atualizar dependencias:

sudo apt-get install autoconfbison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
```	

1 - Instalar git

```
sudo apt-get install git
```

2 - Instalar gerenciador de versões do Ruby

```
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export path="$home/.rbenv/bin:$path"' >> ~/.bashrc
echo 'eval"$(rbenvinit-)"' >> ~/.bashrc
source ~/.bashrc
```

3 - Instalar o Ruby Build - Facilitador de instalação do Ruby

```
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
```

4 - Instalar versões do Ruby    

```
rbenv install -l 
rbenv install 2.4.2
rbenv global 2.4.2
ruby -v
```

5 - Instalar o bundler - controladora de depêndencias do Ruby

```
gem install bundler
```

## Conf. MAC

1 - Instalar o Homebrew (mac ja vem com ruby instalado - versao antiga)

```
ruby-e "$(curl-fsslhttps://raw.githubusercontent.com/homebrew/install/master/install)"
```

2 - Instalar o Rbenv

```
brew install rbenv ruby-build
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
source ~/.bash_profile
```

3 - Instalar versão do ruby

```
rbenv install 2.4.2 
rbenv global 2.4.2
ruby -vProjeto simples
```

4 - Instalar o Bundler 

```
gem install bundler
```

## Instalando VSCODE e plugins

```
Instalar o plugin ruby (Peng Lv)
Instalar o plugin do cucumber - (Aravind Kumar e Euclidity)
Instalar o plugin vscode icons (Roberto Huertas)
```

## O que é Rspec?

Rspec é uma ferramenta de desenvolvimebto orientada por comportamento para programadores em Ruby.
BDD é uma abordagem ao desenvolvimento de SW que combina desenvilvimento orientado a testes, design dirigido por domínio, e planejamento baseado em testes de aceitação. O Rspec ajuda você a fazer a parte TDD dessa equação, com foco nos aspectos de documentação e design do TDD.
Rspec é um a meta-gem, o que é isso? Ela engloba algumas gems que são: spec-core, rspec-expectations e rspec-mocks

```
Urls:
http://rspec.info
https://relishapp.com/rspec
http://betterspecs.org/br/
```

## Instalando Rspec e criando Primeiro Projeto

Instalar gem do rspec
```
gem install rspec
```
Baixa aultima versão do rspec disponibilizada.

### Criando projeto

1 - Crie uma pasta chamada *rspec* via terminal e em seguida acessar esta pasta

2 - Executar comando no terminal *rspec --init*

Saída terminal:

```
╰─➤  rspec --init
  create   .rspec
  create   spec/spec_helper.rb
```

## Describe e it

### O que é Describe

```
Describe é um metodo que cria um grupo de exemplos. Dentro do bloco passado para o describe você pode declarar grupos alinhados usando as describe ou context metodos, ou você pode declarar exemplos usando um it ou metodo especifico.
```

### O que é IT

```
O IT serve para descrever metodos que será testado naquele momento
```

Exemplos: 

- [DESCRIBE - IT](DESCRIBE-IT.md)

## Context

```
O metodo de context faz a mesma coisa que o describe, permitindo contextualizar um bloco de seus testes. Isso é extremamente poderoso para estados de testes quando você adiciona uma configuração mais complicada e um código de desmontagem para realmente entrar em seus objetos.
```

Exemplos: 

- [CONTEXT](CONTEXT.md)

## Let

```
Quando precisa atribuir uma variavel, ao invés de usar um bloco before para criar uma variavel de instância, use let. Ao usar let, a variavel é carregada apenas quando ela é utilizada pela primeira vez no teste e fica no cache até o teste em questão terminar.
```

Exemplos: 

- [Let](LET.md)

## Matcher

### O que é IT

```
O Rspec-expectations é fornecido com vários matchers integrados. Cada matcher pode ser usado com expect(..).to ou expect(..).not_to para definir expectativas positivas e negativas respectivamente.
```

Exemplos usando expect().to:

- expect().to equal - compara e da verdadeiro ou falso
- expect().to be - compara e da verdadeiro ou falso  
- expect().to eql - compara o valor do elemento
- expect().to eq - compara o valor do elemento
- expect().to be_true - compara se é verdadeiro
- expect().to be_truthy - compara se é verdadeiro mesmo
- expect().to be_false - compara se é falso
- expect().to be_falsey - compara se o mesmo é falso
- expect().to be_nill - compara se está vazio

Exemplos usando expect().to.not:

- expect().not_to equal - compara e da verdadeiro ou falso
- expect().not_to be - compara e da verdadeiro ou falso  
- expect().not_to eql - compara o valor não é igual do elemento
- expect().not_to eq - compara o valor não é igual do elemento
- expect().not_to be_true - compara se não é verdadeiro
- expect().not_to be_truthy - compara se não é verdadeiro mesmo
- expect().not_to be_false - compara se não é falso
- expect().not_to be_falsey - compara se o mesmo não é falso
- expect().not_to be_nill - compara se não está vazio

## Hooks (Before, After)

### O que é Hooks

```
Como um desenvolvedor usando o Rspec eu quero executar códigos arbitrário antes e depois de cada exemplo para que eu possa controlar o ambiente no qual ele é executado. Isso é suportado pelos métodos Before e After, em que cada um pega um símbolo indicando o escopo e um bloco de código para executar.
```

Exemplos de Hooks:

- Before(:all) - roda antes de todos os testes
- Before(:suite) - roda antes da execução dos testes
- Before(:each) - roda antes de cada it

- After(:all) - roda depois de todos os testes
- After(:suite) - roda depois da execução de todos os testes
- After(:each) - roda depois de cada it

Exemplos: 

- [HOOKS](HOOKS.md)

## Hooks (Around)

### O que é Hooks (Around)

```
É um bloco que se executa o after e o before dentro dele.
```

Exemplos de Hooks (Around):

- around(:all) - roda antes e depois de todos os testes
- aroubd(:each) - roda antes e depois de cada it

Exemplos: 

- [HOOKS (AROUND)](HOOKS-AROUND.md)

## Tags

### O que é Tag

```
A opção --tag ou -t filtra os exemplos por tags
```

### Tipo de tags

- nome_da_tag: true
- :nome_da_tag
- ~

### Usando o tag

```
No terminal usar o seguinte comando:
```

- rspec . --tag nome_da_tag   - roda tags com esse nome
- rspec . -t nome_da_tag      - um atalho da primeira opção
- --tag ~nome_da_tag          - serve para negar que uma determina tag rode (nao executavel no terminal)

Exemplos: 

- [TAGS](TAGS.md)

## API

### O que é API

```
A sigla API corresponde ás palavras em inglês "Application programming interface". No português "Interface de programação de aplicações". Elas são uma forma de integrar sistemas, possibilitando benefícios como a segurança dos dados, facilidade no intercâmbio entre informações com diferentes linguagens de programação e a monetização de acessos.
As Apis proporciam a integração entre sistemas que possuem liguagem totalmente distintas de maneira ágil e segura.
```

### O que é Json

```
Json - Javascript object notation

É um modelo para armazenamento e transmissão de informações no formato texto. Apesar de muito simples, tem sido bastante utilizado por aplicações web devido a sua capacidade de estruturar informações de uma forma bem mais compacta do que a conseguida pelo modelo xml, tornando mais rapido o parsing dessas informações.
```

### Sintaxe do Json

```
A ideia utilizada pelo json para representar informações é tremendamente simples: para cada valor representado, atribui-se um nome (ou rótulo) que descreve o seu significado. Esta sintaxe é derivada da forma utilizada pelo javascript para representar informações.
```

Exemplos:

- "nome": "Emerson"   - representa uma string 
- "idade": 30         - representa um inteiro
- "temperatura": -10  - representa um numero negativo
- "casado": true      - representa um booleano
- "cheio": null       - representa valor nulo

```
Os arrays são delimitados por colchetes, com seus elementos separados entre vírgulas.
```

```json
[
  "nome": "Emerson",
  "sobrenome": "Pereira",
  "idade": 30 
]
```

```
Os objetos são especificados entre chaves e podem ser compostos por múltiplos pares nome/valor, por arrays e também por outros objetos. Desta forma, um objeto JSON pode representar, virtualmente, qualquer tipo de informação.
```

```json
{
  "titulo": "JSON x XML",
  "resumo": "dois modelos de informações",
  "ano": 2012,
  "genero": ["terror", "acao", "aventura"]
}
```

```
Arrays de objetos
```

```json
{
  "titulo": "JSON x XML",
  "resumo": "dois modelos de informações",
  "ano": 2012,
  "genero": ["terror", "acao", "aventura"]
},
{
  "titulo": "JSON",
  "resumo": "api service",
  "ano": 2012,
  "genero": ["western"]
}
```

### O que é Request (requisição) e Response (resposta)

#### O que é cliente servidor

```
O cliente faz pedidos de recursos. Tais pedidos são tecnicamente chamados de requisições. O pedido é feito a API.
A API receve essa requisição e consulta um computador especial, responsável por organizar a chegada das requisições e buscar os recursos requisitados.
Esse computador é como o que você usa para trabalhar ou assistir um video, mas é bem mais poderoso e tem funções dedicadas a se comunicar em alta-velocidade com outros computadores do mundo. O nome desse computador é servidor.
Essa requisição feita pela API é como o garçom falando a cozinha o que o cliente pediu.
```

#### O que é Request

```
As requisições são os pedidos feitos pelo cliente a API.
Para que uma requisição seha valida, ela deve rwe um formato especifico. O protocolo usad nas requisições é o HTTP. Quando você acessa um site que tem  "HTTP://" no começo, você está dizendo ao seu navegador para usar esse protocolo ao carregar o site.

A requisição dever ser comporta por 4 partes:
URL
METODO
HEADER
BODY
```

#### O que é Response

```
O servidor interpreta essa informação (requisição) e retorna algo.
A resposta tem uma anatomia bem definida, parecida com a requisic'ão. Ela é composta por tês partes:
Código HTTP
HEADER
BODY
```

### O que é Body e Header

#### O que é Body

```
São todos os parâmetros que tornam cada requisição diferente entre si, são os detalhes.
```

```json
[
  {
    "titulo": "JSON x XML",
    "resumo": "dois modelos de informações",
    "ano": 2012,
    "genero": ["terror", "acao", "aventura"]
  },
  {
    "titulo": "JSON",
    "resumo": "api service",
    "ano": 2012,
    "genero": ["western"]
  }
]
```

#### O que é Header

```
Header contém uma lista de detalhes sobre como o cliente quer que a mensagem seja interpretada. Os diferentes servidores ou apis podem aceitar diferentes headers.
Por exemplo, se você está em um celular e clica em algum link para outro site, como você recebe exatamente o site em versão mobile, que se encaixa perfeitamente ás dimensões do seu dispositivo.
```

### O que é código de status

``
A API usa os seguintes códigos HTTP para indicar retornos de sucesso comuns:
``

```
1XX - informações gerais;
2XX - sucesso na requisição e na resposta;
3XX - redirecionamento para outra url;
4XX - erro (por parte do cliente);
5XX - erro (por parta do servidor).

Portanto, o erro 404 se trata de uma requisição inválida, já que o cliente está pedindo ao servidor algo que não existe. Outro código famoso é o 200 OK, que é retoando sempre que a requisição foi entendida e retornada com sucesso.
```

## Verbos HTTP

### O que é verbos HTTP

```
O protocolo HTTP define métodos (às vezes referidos como verbos) para indicar a ação desejada a ser realizada no recusro identificado. O que este recurso representa, se são dados pré-existentes ou dados gerados dinamicamente, depende da implementação do servidor. Nuitas vezes, o recurso corresponde a um arquivo ou a saida de um executavel residente no servidor.
```

### Verbo GET

```
O método get solicita uma representação do recusro especificado. Solicitações usando get só devem recuperar dados e não devem ter outro efeito.
```

### Verbo POST

```
O método post solicita que o servidor aceite a entidade incluida na solicitação como um novo subordinado do recurso na web identificado pelo URI. Os dados posted podem ser, por exemplo, uma anotação para recursos existentes; uma mensagem para um quadro de avisos, newsgroup, lista discussão de comentários; um bloco de dados que é o resultado do envio de um formulário da web para um processo de manipulação de dados; ou um item para adicionar a um banco de dados.
```

### Verbo PUT

```
O método put solicita que a entedida incluida seja armazenada sob o URI fornecido. Se o uri se referir a um recusro já existente, ele será modificado; se o uri nào apontar para um recusro existente, o servidor poderá criar o recurso com o esse uri.
```

### Verbo PATCH

```
O método patch aplica modificações parciais a um recurso.
```

### Verbo DELETE

```
O métpdp delete exclui o recurso especificado.
```

### Outros verbos:

- HEAD - o método head solicita uma resposta de forma idêntica ao método get, porém ser conter o recurso "body";
- CONNECT - o método connect estabelece um túnel para conexão com o servidor a partir do recurso alvo;
- OPTIONS - o método options é usado para descrever as opções de comunicação com o recusro alvo;
- TRACE - o método trace executa uma chamada de loopback de teste durante o caminho de conexão com o recurso alvo.

## HTTParty e Rspec

### O que é o HTTParty

```
É uma gem do ruby criada para realizar requisições de uma API Rest

URL: https://github.com/jnunemaker/httparty
```

Configurações e exemplos:

- [HTTPARTY-RSPEC](HTTPARTY-RSPEC.md)

## Gerando relatórios com Rspec

- [RELATORIO-RSPEC](RELATORIO-RSPEC.md)

## Gerando relatórios com Rspec

- [VARIOS-AMBIENTES](VARIOS-AMBIENTES.md)

[Projeto Final](PROJETO-FINAL.md)