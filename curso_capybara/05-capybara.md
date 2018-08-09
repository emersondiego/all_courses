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

- Incluir a gem 'selenium-webdriver' no Gemfile

```
gem 'selenium-webdriver'
```

5 - Realizar bundle install na raiz do projeto

6 - Incluir require do selenium-webdriver no env.rv

```
require 'selenium-webdriver'ss
```

## AULA 26 - Configurando o Capybara e Drivers

