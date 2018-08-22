## Testando instalação $ Docker

1 - Abrir terminal

2 - Digitar terminal

``
╰─➤  docker container run hello-world
``

Saida terminal:

````
╰─➤  docker container run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with: $ docker run -it ubuntu bash
Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/engine/userguide/
````

## Entendendo comando Run

````
O comando run é a porta de entrada do mundo docker
RUN = docker image pull / docker container create / docker container start / docker container exec
````

## Ferramentas diferentes

````
Existem dois modos de executas containers: modo daemon e modo iterativo (modo que se faz experimento)
````

Exercicios modo iterativo

Terminal:

- Teste local
$ bash --version

- No docker
$ docker container run debian bash --version

  Irá informar a versão do bash do debian

- $ docker container ps

  Informa todos os container ativos

- $ docker container ps -a

  Informa todos os containers independente do status

- $ docker container run --rm debian

  depois de executar o container em seguida ele remove

  --rm => remove um container

## Run cria sempre novos containers

- docker container run -it debian bash

  Acessa o terminal do container
  i - iteratvo
  t - terminal

  Quando executa no modo run sempre sera criado novos container

## Como renomear nomes dos containers

-  docker container run --name mycontainer -it debian bash

  --name mycontainer = cria um novo container com esse nome de < mycontainer >

  obs. se eu tentar novamente este mesmo comando, não ira permiter criar um novo container, pois ja existe esse nome

## Reutilizar Containers

- $ docker container ls
  Lista os containers criados

- $ docker container ls -a
  Lista todos os containers independente do status

- $ docker cotainer start -ai mycontainer

  start =  start container
  a = atach, ter acesso ao terminal
  i = itetativo

  Criar arquivo: $ touch teste.txt

  Ao acessar esse container novamente o arquivo estara la

  Regras: Criar nomes significantes

## Mapear portas dos containers

Instalar servidor Nginx

1 - $ docker container run -p 8080:80 nginx

-p = parametro para passar porta 
8080 = Porta exposta fora do container
80 = porta interna dentro do container

Logo após baixar o nginx ja vai estar startando na porta 8080

2 - Outro terminal

$ curl http://localhost:8080

Será retornando a pagina padrão do Nginx e assim como no navegador

3 - $ docker container ps

Vai mostrar o container ativo nginx

4 - Control C 

Vai parar os processos do nginx

## Mapear diretórios para container

Mapeando mais simples volume de uma pasta no computador host e uma no container

Passo a Passo:

1 - Criar pasta na maquina local 
$ mkdir curso-docker

2 - acessar pasta e criar uma uma pasta 
$ mkdir exercicio-volume

3 - acessar pasta raiz pelo editor de texto

4 - Executar em seguida dentro da pasta exercicio-volume
$ docker container run -p 8080:80 -v $(pwd)/not-found:/usr/share/nginx/html nginx

$(pwd) = mostra o caminho absoluto
-v = mapeia volume

5 - Criar uma pasta dentro de volume chamada html e criar um arquivo index.html com algum trecho de codigo

6 - Executar novamente passando o caminho do arquivo html

$ docker container run -p 8080:80 -v $(pwd)/html:/usr/share/nginx/html nginx

Ao acessar o localhost/8080 sera acessado o html que foi passado

## Rodar serviço web em background

Modo Daemon

1 - Executar comando
$ docker container run -d --name ex-daemon-basic -p 8080:80 -v $(pwd)/html:/usr/share/nginx/html nginx

-d = modo daemon

É apresentado o id do container no terminal e esta rodando em background

2 - Para verificar se esta de pé 
$ docker container ps

3 - Parar o container
$ docker container stop ex-daemon-basic

## Gerenciar o container em background

1 - Start
$ docker container start ex-daemon-basic

2 - Mostra que o container esta sendo executado
$ docker container ps

3 - Reinicia container
$ docker container restart ex-daemon-basic

4 - Parar container
$ docker container stop ex-daemon-basic

## Manipulação de containers em modo daemon

Comandos:

1 - Lista containers

$ docker container ls
$ docker container list
$ docker container ps
$ docker ps

2 - Lista containers ativos e paradps

$ docker container list -a
$ docker container ls -a
$ docker container ps -a
$ docker ps -a

3 - Acessar logs de um container, antes startar um container

$ docker container logs < nome_container >

4 - Mostra as caracteristica do Container
$ docker container inpect < nome_container >

5 - Tipo de sistema dentro do container
$ docker container exec < nome_container > uname -or

## Nova sintaxe do Docker client

Exemplos:

$ docker container ls

$ docker image ls

$ docker volume ls

Exemplo de apagar imagem:

$ docker image rm < nome_container >