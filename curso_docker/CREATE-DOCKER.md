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
