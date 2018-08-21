## Testando instalação Docker

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
