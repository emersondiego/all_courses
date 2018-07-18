# Curso de Automação de Testes com Capybara, Cucumber e Ruby

### AULA 3  - Conf. Linux

Default 

    sudo apt-get update

    Atualizar dependencias

    sudo apt-get install autoconfbison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-de
    

1 - Instalar git

    sudo apt-get install git

2 - Instalar gerenciador de versões do Ruby

    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    echo 'export path="$home/.rbenv/bin:$path"' >> ~/.bashrc
    echo 'eval"$(rbenvinit-)"' >> ~/.bashrc
    source ~/.bashrc

3 - Instalar o Ruby Build - Facilitador de instação do Ruby

    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

4 - Instalar versões do Ruby    

    rbenv install -l 
    rbenv install 2.4.2
    rbenv global 2.4.2
    ruby -v

5 - Instalar o bundler - controladora de depêndencias do Ruby

    gem install bundler

### AULA 4 - Conf. MAC
1 - Instalar o Homebrew (mac ja vem com ruby instalado - versao antiga)

    ruby-e "$(curl-fsslhttps://raw.githubusercontent.com/homebrew/install/master/install)"

2 - Instalar o Rbenv

    brew install rbenv ruby-build
    echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
    source ~/.bash_profile

3 - Instalar versão do ruby

    rbenv install 2.4.2 
    rbenv global 2.4.2
    ruby -v

4 - Instalar o Bundler 

    gem install bundler
  
### AULA 5 - Instalando VSCODE e plugins
    Instalar o plugin ruby (Peng Lv)
    Instalar o plugin do cucumber - (Aravind Kumar e Euclidity)
    Instalar o plugin vscode icons (Roberto Huertas)

### AULA 6 - O que é Ruby

    Teoria - Ver video

### AULA 7 - Ruby básico (parte 1)


