## Diferencas entre container e imagem

````
Imagem modelo de arquivos de leitura
Container processo segregado e isolado que podem contem varios processos para a imagem
````

Comandos:

````
$ docker container --help 

$ docker image --help

# docker volume --help

Mostra todos os sub-comandos que pode ser feito
````

## Entendendo melhor as imagens

````
$ docker image pull redis:latest
$ docker image ls
$ docker image inspect redis:latest

Criar nova tag

$ docker image tag redis:latest coder_redis

$ docker image ls

Monstra a nova image pelo nome criado 

Caso queira exlcuir as imagens:

$ docker image redis:latest coder_redis
````

``
Nunca aponta para ultima versão do docker, pode quebrar algo e pode acontecer de quebrar algo inesperado
``

## Comandos básicos do gerenciamento de imagens

7 comandos importantes:

````
$ docker image pull => baixa imagens do docker hub

$ docker image ls => lista as imagens 

$ docker image rm => remove imagem (colocando tags ou hash das imagens)

$ docker image inspect => mostra informações da maquina 

$ docker image tag => muda o nome da image origin pra outra, coloca o nome da imagem origem e em seguida a que quer colocar 

$ docker image build => interpreta e construi nossa imagem

$ docker image push => cria uma image e registra a imagem tanto local como no registry 
````

## Docker Hub x Docker Registry

````
Docker Registry é um serviço server side que envia e recebe imagens
Docker Hub é um saas produto na nuvem, contem o registry, possui interface grafica, imagens oficais, 
````

## Meu primeiro Build

Passo a passo

1 - Criar uma nova pasta, exemplo < primeiro-build >

2 - Dentro da pasta criar arquivo Dockerfile (não possui extensão)

3 - Arquivo:

````
FROM nginx:latest
RUN echo '< h1 >Hello World!< /h1 >' > /usr/share/nginx/html/index.html   
````

- FROM => se baseia a imagem a partir de uma imagem

- RUN =>  nesse exemplo a saida de echo ser impressa em um arquivo na pasta xx

4 - Acessar pasta criada no terminal

5 - E digitar no terminal

```
$ docker image build -t first-build .

O '.' indica que é na pasta local que esta o Dockerfile, pasta atual
```

Saida terminal

````
╰─➤  docker image build -t first-build .                                                                                                                                                                                       
Sending build context to Docker daemon  2.048kB
Step 1/2 : FROM nginx:latest
latest: Pulling from library/nginx
be8881be8156: Pull complete
32d9726baeef: Pull complete
87e5e6f71297: Pull complete
Digest: sha256:d85914d547a6c92faa39ce7058bd7529baacab7e0cd4255442b04577c4d1f424
Status: Downloaded newer image for nginx:latest
 ---> c82521676580
Step 2/2 : RUN echo '<h1>Hello World!</h1>' > /usr/share/nginx/html/index.html
 ---> Running in ce21bcddf8ea
Removing intermediate container ce21bcddf8ea
 ---> a597d29de7dd
Successfully built a597d29de7dd
Successfully tagged first-build:latest
````

6 - Verificar se imagem foi criada

````
╰─➤  docker image ls
REPOSITORY                            TAG                  IMAGE ID            CREATED              SIZE
first-build                           latest               a597d29de7dd        About a minute ago   109MB
````

7 - Excutar container a partir da imagem 

Terminal:

╰─➤  docker container run -p 80:80 first-build

8 - Acessar pagina no navegador localhost:80

## Uso das instruções de preparação

### Exemplo 2

1 - Criar nova pasta build-com-arg

2 - Criar arquivo Dockerfile dentro da pasta criad

````ruby
FROM debian
LABEL maintainer 'Emerson <edap.diego@gmail.com>'
ARG S3_BUCKET=files
ENV S3_BUCKET=${S3_BUCKET}
````

- LABEL => quem é que mantem a imagem
- ARG => passa argumento n hora de construir a build
- ENV => ambiente

3 - Acessar a pasta pelo terminal

4 - No terminal buildar imagem

$ docker image build -t ex-build-arg .

Saida terminal:

```
╰─➤  docker image build -t ex-build-arg .
Sending build context to Docker daemon  2.048kB
Step 1/4 : FROM debian
 ---> 3bbb526d2608
Step 2/4 : LABEL maintainer 'Emerson <edap.diego@gmail.com>'
 ---> Running in 8fec71c7492c
 ---> 762fea5ba7c8
Removing intermediate container 8fec71c7492c
Step 3/4 : ARG S3_BUCKET=files
 ---> Running in 002e24817fe8
 ---> 216c6a09716d
Removing intermediate container 002e24817fe8
Step 4/4 : ENV S3_BUCKET ${S3_BUCKET}
 ---> Running in 9f861cfc6982
 ---> 4374812bce03
Removing intermediate container 9f861cfc6982
Successfully built 4374812bce03
Successfully tagged ex-build-arg:latest
```

5 - Rodando image

$ docker container run ex-build-arg bash -c 'echo $S3_BUCKET'

Saida terminal
```
╰─➤  docker container run ex-build-arg bash -c 'echo $S3_BUCKET'
files
```
Caso queira mudar o arg criada:

$ docker image build --build-arg S3_BUCKET=myapp -t ex-build-arg .   

Saida terminal

```
╰─➤  docker image build --build-arg S3_BUCKET=myapp -t ex-build-arg .                                           1 ↵
Sending build context to Docker daemon  2.048kB
Step 1/4 : FROM debian
 ---> 3bbb526d2608
Step 2/4 : LABEL maintainer 'Emerson <edap.diego@gmail.com>'
 ---> Using cache
 ---> 762fea5ba7c8
Step 3/4 : ARG S3_BUCKET=files
 ---> Using cache
 ---> 216c6a09716d
Step 4/4 : ENV S3_BUCKET ${S3_BUCKET}
 ---> Running in 70fca0b3cde5
 ---> e2ee918bee3b
Removing intermediate container 70fca0b3cde5
Successfully built e2ee918bee3b
Successfully tagged ex-build-arg:latest
```

Testar no terminal:

╰─➤  docker container run ex-build-arg bash -c 'echo $S3_BUCKET'
myapp

6 - Passando filtros para trazer apenas o que desejo

$  docker image inspect --format="{{index .Config.Labels \"maintainer\"}}" ex-build-arg

Saida terminal

```
╰─➤  docker image inspect --format="{{index .Config.Labels \"maintainer\"}}" ex-build-arg
Emerson <edap.diego@gmail.com>
```

## Uso das instruções de povoamento

1 - Cria nova pasta build-com-copy 

2 - Dentro da pasta criar arquivo index.html

````html
<a href="conteudo.html">Conteudo do Site</a>
````

O arquivo index.html será empurrado para dentro da imagem

3 - Criar arquivo Dockerfile

````ruby
FROM nginx
LABEL maintainer 'Emerson Pereira <edap.diego@gmail.com>'

RUN echo '<h1>Sem conteudo</h1>' > /usr/share/nginx/html/conteudo.html
COPY *.html /usr/share/nginx/html/
````

- RUN echo '<h1>Sem conteudo</h1>' > /usr/share/nginx/html/conteudo.html => sera jogado essa informação no arquivo
- COPY *.html /usr/share/nginx/html/ => copia o arquivo com extensao html para o caminho informado

4 - Executar comando de criar imagem

```
╰─➤  docker image build -t ex-build-copy .
Sending build context to Docker daemon  3.072kB
Step 1/4 : FROM nginx
latest: Pulling from library/nginx
be8881be8156: Pull complete
32d9726baeef: Pull complete
87e5e6f71297: Pull complete
Digest: sha256:d85914d547a6c92faa39ce7058bd7529baacab7e0cd4255442b04577c4d1f424
Status: Downloaded newer image for nginx:latest
 ---> c82521676580
Step 2/4 : LABEL maintainer 'Emerson Pereira <edap.diego@gmail.com>'
 ---> Running in b5dbcee104e8
 ---> ba5a26efc222
Removing intermediate container b5dbcee104e8
Step 3/4 : RUN echo '<h1>Sem conteudo</h1>' > /usr/share/nginx/html/conteudo.html
 ---> Running in 077e229f6d87
 ---> b2987eba3b77
Removing intermediate container 077e229f6d87
Step 4/4 : COPY *.html /usr/share/nginx/html/
 ---> dcff3a5db04a
Removing intermediate container 43abeb814419
Successfully built dcff3a5db04a
Successfully tagged ex-build-copy:latest
```

5 - Testar nossa imagem

$ docker container run -p 80:80 ex-build-copy

Abrir no navegador e digitar localhost:80

## Uso das instruções para execucao em container

Criar servidor em Python

1 - Criar uma nova pasta build-dev e criar arquivo index.html dentro dele

````html
<p>Hello from Python</p>
````
2 - Criar mais um arquivo chamado run.py (ver arquivo com as configurações)

3 - Criar arquivo Dockerfile

````ruby
FROM python:3.6
LABEL maintainer 'Emerson Pereira <edap.diego@gmail.com>'

RUN useradd www && \
    mkdir /app && \
    mkdir /log && \
    chown www /log

USER www
VOLUME /log
WORKDIR /app
EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/python"]
CMD ["run.py"]
````

4 - Terminal

$ docker image build -t ex-build-dev .

5 - $ docker container run --rm -it -v $(pwd):/app -p 80:8000 --name python-server ex-build-dev

6 - Testar nonavegador localhost:80

7 - $  docker run -it --volumes-from=python-server debian cat /log/http-server.log
Comando acima de ser executado com a imagem startada

Ler o volume compartilhados que foi criado ao container e assim acessar o arquivo a partir de outro container, neste caso o debian

## Enviar imagens para o Docker Hub

1- Criar conta em hub.docker.com

2 - docker image ls  => escolher  aimagem que voce deseja subir


3 - Criar uma tag para a imagem que deseja enviar
$ docker image tag < image que deseja subir >  < novo-nome-imagem:1.0 >

4 - Logar no hub
$ docker login --username=nomedeuser

5 - Informar senha

6 - Fazer o push da imagem que foi criada
$ docker image push < novo-nome-imagem:1.0 >