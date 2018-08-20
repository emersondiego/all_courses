
Git: https://github.com/cod3rcursos/curso-docker

## O que é Docker

1 - Não é um sistema de virtualização tradicional

2 - Engine de administração de containers (processo isolado que é possivel startar aplicações, mantendo um ambiente isolado)

3 - Utiliza os serviços LXC (Linux Containers)

4 - Tecnologia de código aberto - Open Source e escrito em GO

5 - Sistema de virtualização baseado em software (SO)

6 - Host container compartilham o kernel

7 - Empacota software de vários níveis de isolamento


## O que são containers


1 - Segregação de processos do mesmo Kernel (Isolamento)

2 - Sistemas de arquivos criados a partir de uma imagem

3 - Ambientes leve e portáveis no qual aplicações são executadas

4 - Encapsula todos os bonários e bibliotecas necessárias para execução de uma App

5 - Algo entre um chroot e uma VM

## O que são imagens Docker

1 - Modelo de sistema de arquivo somente-leitura usado para criar containers

2 - Imagens são criadas são criadas através de um processo chamado build

3 - São armazenadas em repositórios no Registry

4 - São compostas por uma ou mais camadas (layers)

5 - Uma camada representa uma ou mais mudanças no sistema de arquivos

6 - Uma camada é também chamada de imagem intermediaria

7 - A junção dessas camadas formam uma imagem

8 - Apenas a última camada pode ser laterada quando o container for iniciado

9 - AUFS (Advanced multi-layered unification filesystem) é muito usado

10 - O grande objetico dessa estratégia de dividir uma imagem em camadas é o reuso

11 - É possivel compor imagens a partir de camadas de outras imagens

repositório: https://hub.docker.com/


## Imagem vs Container

Imagem (classes) é o modelo e containers (objetos) são as camadas dessas imagens

## Arquitetura

Registry 
  Hub - repositório na nivem 

Daemon
  Imagens
  containers

Client
  Cli
  App (rest api)
  Kitematic

  [INSTALAÇÃO - Visão Geral](INSTALL.md)