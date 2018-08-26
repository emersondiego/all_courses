### Exemplo usando o compose

Usaremos três serviços (container: BD - mongo, back-end - mongo, front-end - nginx)

Seguir estrutura de arquivos no path /node-mongo-compose

Aopós todos configurações:

1 - Subir os containers

$ docker-compose up

2 - Testar as conexões:

http://localhost/ = frontend
http://localhost/3000 = backend