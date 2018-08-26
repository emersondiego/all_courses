### Email com works

Criar pasta email-work-compose

#### 1 - Iniciando a composição com o banco de dados


a - Dentro da pasta criar arquivo docker-compose.yml


````yml
version: '2'
services:
  db:
    image: postgres:9.6
````

b - Rodar comando: 

````
$ docker-compose up -d
````

c - Rodar comando para ver os processos rodando: 

````
$ docker-compose ps
````

d - Rodar comando dentro do db para listar os bancos de dados

````
$ docker-compose exec db psql -U postgres -c '\l'
````

e - Parar serviços do banco

````
$ docker-compose down
````

#### 2 - Usando volumes e scripts de banc de ddos

- Criar pasta na raiz chamada scripts e dentro dessa pagina criar arquivo init.sql

a - Criar scripts de banco de dados:

````
create database email_sender;

\c email_sender

create table emails (
    id serial not null,
    data timestamp not null default current_timestamp,
    assunto varchar(100) not null,
    mensagem varchar(250) not null
);
````

b - Criar novo arquivo chamado check.sql

````
\l
\c email_sender
\d emails
````

c - No arquivo docker-compose incluir scripts

````yml

version: '3'
volumes:
  dados:
networks:
  banco:
  web:
  fila:
services:
  db:
    image: postgres:9.6
    volumes:
      # Volume dos dados
      - dados:/var/lib/postgresql/data
      # Scripts
      - ./scripts:/scripts
      - ./scripts/init.sql:/docker-entrypoint-initdb.d/init.sql
````

d - No terminal validar se tudo deu certo com a imagem do banco

````
$ docker-compose ps

$ docker-compose up -d

$ docker-compose ps

$ docker-compose exec db psql -U postgres -f /scripts/check.sql
````

Saida terminal:

````
╰─➤  docker-compose exec db psql -U postgres -f /scripts/check.sql
                                  List of databases
     Name     |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges
--------------+----------+----------+------------+------------+-----------------------
 email_sender | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
 postgres     | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
 template0    | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
              |          |          |            |            | postgres=CTc/postgres
 template1    | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
              |          |          |            |            | postgres=CTc/postgres
(4 rows)

You are now connected to database "email_sender" as user "postgres".
                                    Table "public.emails"
  Column  |            Type             |                      Modifiers
----------+-----------------------------+-----------------------------------------------------
 id       | integer                     | not null default nextval('emails_id_seq'::regclass)
 data     | timestamp without time zone | not null default now()
 assunto  | character varying(100)      | not null
 mensagem | character varying(250)      | not null
````

#### 3 - Começando nossa camada de front-end

a - No docker-compose incluir image do front-end (nginx)

````yml
version: '2'
volumes:
  dados:
services:
  db:
    image: postgres:9.6
    volumes:
      # Volume dos dados
      - dados:/var/lib/postgresql/data
      # Scripts
      - ./scripts:/scripts
      - ./scripts/init.sql:/docker-entrypoint-initdb.d/init.sql
  frontend:
    image: nginx:1.13
    volumes:
      # site
      - ./web:/usr/share/nginx/html/
    ports:
      - 80:80
````

b - Criar pasta na raiz do projeto chamada web e dentro da pasta criar arquivo index.html

````html
<html>
    <head>
        <meta charset='uft-8'>

        <title>E-mail Sender</title>

        <style>
            label { display: block; }
            textarea, input { width: 400px; }
        </style>
    </head>
    <body class="container">
        <h1>E-mail Sender</h1>
        <form action="">
            <div>
                <label for="assunto">Assunto</label>
                <input type="text" name="assunto">
            </div>

            <div>
                <label for="mensagem">Mensagem</label>
                <textarea name="mensagem" cols="50" rows="6"></textarea>
            </div>

            <div>
                <button>Enviar !</button>
            </div>
        </form>
    </body>
</html>
````

c- Testando container

````
$ docker-compose ps

$ docker-compose down

$ docker-compose up -d

$ docker-compose logs -f -t
````

#### 4 - Aplicativo para enfileirar as mensagens

a - Criar uma nnova pasta na raiz chamada app e dentro da pasta criar arquivo app.sh

````sh
#!/bin/sh

pip install bottle==0.12.13 psycopg2==2.7.1 redis==2.10.5
python -u sender.py
````

b - Criar arquivo sender.py dentro de app

````python
from bottle import route, run, request

@route('/', method='POST')
def send():
    assunto = request.forms.get('assunto')
    mensagem = request.forms.get('mensagem')
    return 'Mensagem enfileirada ! Assunto: {} Mensagem: {}'.format(
        assunto, mensagem
    )

if __name__ == '__main__':
    run(host='0.0.0.0', port=8080, debug=True)
````

c = no html em web/index.html incluir chamada da api

````html
   <form action="http://localhost:8080" method="POST">
````

d - Atulizar o dkcer-compose com o serviço de aplicação

````yml
version: '2'
volumes:
  dados:
services:
  db:
    image: postgres:9.6
    volumes:
      # Volume dos dados
      - dados:/var/lib/postgresql/data
      # Scripts
      - ./scripts:/scripts
      - ./scripts/init.sql:/docker-entrypoint-initdb.d/init.sql
  frontend:
    image: nginx:1.13
    volumes:
      # Site
      - ./web:/usr/share/nginx/html/
    ports:
      - 80:80
  app:
    image: python:3.6
    volumes:
      # aplicação
      - ./app:/app
    working_dir: /app
    command: bash ./app.sh
    ports:
      - 8080:8080
````

e - Rodar terminal

````
$  docker-compose down

$  docker-compose up -d

$  docker-compose logs -f -t

http://localhost/
````

#### 5 - Configurando um proxy reverso

Configurar nginx

a - Dentro da raiz criarpasta nginx e criar arquivo default.conf

````
server {
    listen 80;
    server_name localhost;

    location / {
        root /usr/share/nginx/html;
        index index.html index.htm;
    }

    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
        root /usr/share/nginx/html;
    }

    location /api {
        proxy_pass http://app:8080/;
        proxy_http_version 1.1;
    }
}
````

b - Dentro do docker-compose criar um novo volume no servico front-end

````yml
version: '2'
volumes:
  dados:
services:
  db:
    image: postgres:9.6
    volumes:
      # Volume dos dados
      - dados:/var/lib/postgresql/data
      # Scripts
      - ./scripts:/scripts
      - ./scripts/init.sql:/docker-entrypoint-initdb.d/init.sql
  frontend:
    image: nginx:1.13
    volumes:
      # Site
      - ./web:/usr/share/nginx/html/
      # configuração do proxy reverso
      - ./nginx/default.conf:/etc/nginx/conf.d/default.config
    ports:
      - 80:80
  app:
    image: python:3.6
    volumes:
      # aplicação
      - ./app:/app
    working_dir: /app
    command: bash ./app.sh
    ports:
      - 8080:8080
````

c -  No index.html remover em action a chamada da porta 8080

````html
<form action="http://localhost/api" method="POST">
````

d - Remover no docker-compose porta do app

````yml
version: '2'
volumes:
  dados:
services:
  db:
    image: postgres:9.6
    volumes:
      # Volume dos dados
      - dados:/var/lib/postgresql/data
      # Scripts
      - ./scripts:/scripts
      - ./scripts/init.sql:/docker-entrypoint-initdb.d/init.sql
  frontend:
    image: nginx:1.13
    volumes:
      # Site
      - ./web:/usr/share/nginx/html/
      # configuração do proxy reverso
      - ./nginx/default.conf:/etc/nginx/conf.d/default.config
    ports:
      - 80:80
  app:
    image: python:3.6
    volumes:
      # aplicação
      - ./app:/app
    working_dir: /app
    command: bash ./app.sh
````

e - Testar:

````
$ docker-compose down

$ docker-compose up -d

http://localhost
````

#### 6 - Redes, dependências e banco de dados

a -  no docker-compose incluir:

````yml
version: '2'
volumes:
  dados:
networks:
  banco:
  web:
services:
  db:
    image: postgres:9.6
    volumes:
      # Volume dos dados
      - dados:/var/lib/postgresql/data
      # Scripts
      - ./scripts:/scripts
      - ./scripts/init.sql:/docker-entrypoint-initdb.d/init.sql
    networks:
      - banco
  frontend:
    image: nginx:1.13
    volumes:
      # Site
      - ./web:/usr/share/nginx/html/
      # configuração do proxy reverso
      - ./nginx/default.conf:/etc/nginx/conf.d/default.conf
    ports:
      - 80:80
    networks:
      - web
    depends_on:
      - app
  app:
    image: python:3.6
    volumes:
      # aplicação
      - ./app:/app
    working_dir: /app
    command: bash ./app.sh
    networks:
      - banco
      - web
    depends_on:
      - db
````

b - Modificar codigo python para receber essas modificações app/sender.py

````python
import psycopg2
from bottle import route, run, request

DSN = 'dbname=email_sender user=postgres host=db'
SQL = 'INSERT INTO emails (assunto, mensagem) VALUES (%s, %s)'

def register_message(assunto. mensagem):
    conn = psycopg2.connect(DSN)
    cur = conn.cursor()
    cur.execute(SQL, (assunto, mensagem))
    conn.commit()
    cur.close()
    conn.close()

    print('Mensagem regitrada!')

@route('/', method='POST')
def send():
    assunto = request.forms.get('assunto')
    mensagem = request.forms.get('mensagem')
    register_message(assunto, mensagem)
    return 'Mensagem enfileirada ! Assunto: {} Mensagem: {}'.format(
        assunto, mensagem
    )

if __name__ == '__main__':
    run(host='0.0.0.0', port=8080, debug=True)
````

c - Rodar terminal

````
$  docker-compose down

$  docker-compose up -d

$  docker-compose logs -f -t

http://localhost/
````

d - Fazer um select na tabela de email

````
╰─➤  docker-compose exec db psql -U postgres -d email_sender -c 'select * from emails'                       1 ↵ id |            data            | assunto | mensagem
----+----------------------------+---------+-----------
  1 | 2018-08-26 18:48:58.525861 | terter  | tretetete
(1 row)
````

#### 7 - Fila e workers

a - No docker-compose adicionar fila e incluir serviços de queue e worker

````yml
version: '2'
volumes:
  dados:
networks:
  banco:
  web:
  fila:
services:
  db:
    image: postgres:9.6
    volumes:
      # Volume dos dados
      - dados:/var/lib/postgresql/data
      # Scripts
      - ./scripts:/scripts
      - ./scripts/init.sql:/docker-entrypoint-initdb.d/init.sql
    networks:
      - banco
  frontend:
    image: nginx:1.13
    volumes:
      # Site
      - ./web:/usr/share/nginx/html/
      # configuração do proxy reverso
      - ./nginx/default.conf:/etc/nginx/conf.d/default.conf
    ports:
      - 80:80
    networks:
      - web
    depends_on:
      - app
  app:
    image: python:3.6
    volumes:
      # aplicação
      - ./app:/app
    working_dir: /app
    command: bash ./app.sh
    networks:
      - banco
      - web
      - fila
    depends_on:
      - db
      - queue
  queue:
    image: redis:3.2
    networks: 
      - fila
  worker: 
    image: python:3.6
    volumes:
      # works
      - ./worker:/worker
    working_dir: /worker
    command: bash ./app.sh
    networks:
      - fila
    depends_on:
      - queue
````

b - No arquivo app.sh sera preciso incluir uma nova dependencia

```
redis==2.10.5
```

c- Em seguida refatorar o arquivo app/sender.py

````python
import psycopg2
import redis
import json
from bottle import Bottle, request

class Sender(Bottle):

    def __init__(self):
        super().__init__()
        self.route('/', method='POST', callback=self.send)   
        self.fila = redis.StrictRedis(host='queue', port=6379, db=0)
        DSN = 'dbname=email_sender user=postgres host=db'
        self.conn = psycopg2.connect(DSN)

    def register_message(self, assunto, mensagem):
        SQL = 'INSERT INTO emails (assunto, mensagem) VALUES (%s, %s)'
        cur = self.conn.cursor()
        cur.execute(SQL, (assunto, mensagem))
        self.conn.commit()
        cur.close()

        msg = {'assunto': assunto, 'mensagem': mensagem}
        self.fila.rpush('sender', json.dumps(msg))

        print('Mensagem regitrada!')

    def send(self):
        assunto = request.forms.get('assunto')
        mensagem = request.forms.get('mensagem')

        self.register_message(assunto, mensagem)
        return 'Mensagem enfileirada ! Assunto: {} Mensagem: {}'.format(
            assunto, mensagem
        )

if __name__ == '__main__':
    sender = Sender()
    sender.run(host='0.0.0.0', port=8080, debug=True)
````

d - Criar nova pasta na raiza chamada worker e criar arquivo app.sh

````
#!/bin/sh

pip install redis==2.10.5
python -u worker.py
````

e - Na mesma pasta criar arquivo fonte worker.py

````python
import redis
import json
import os
from time import sleep
from random import randint

if __name__ == '__main__':
    redis_host = os.getenv('REDIS_HOST', 'queue')
    r = redis.Redis(host=redis_host, port=6379, db=0)
    print('Aguardando mensagens ...')
    while True:
        mensagem = json.loads(r.blpop('sender')[1])
        # Simulando envio de e-mail...
        print('Mandando a mensagem:', mensagem['assunto'])
        sleep(randint(15, 45))
        print('Mensagem', mensagem['assunto'], 'enviada')
````

f - Testando no console

````
$  docker-compose down

$  docker-compose up -d

$  docker-compose logs -f -t

http://localhost/
````

#### 8 - Escalar é preciso (Múltiplas instâncias)

a  - Personalizar imagem do worker, dentro da pasta worker cirar arquivo Dockerfile

````
FROM python:3.6
LABEL maintainer 'Emerson Pereira <edap.diego@gmail.com>'

ENV PYTHONUNBUFFERED 1
RUN pip install redis==2.10.5

ENTRYPOINT ["/usr/local/bin/python"]
````

b - Alterar o docker-compose para reconhecer o Dckerfile do worker

````yml
version: '2'
volumes:
  dados:
networks:
  banco:
  web:
  fila:
services:
  db:
    image: postgres:9.6
    volumes:
      # Volume dos dados
      - dados:/var/lib/postgresql/data
      # Scripts
      - ./scripts:/scripts
      - ./scripts/init.sql:/docker-entrypoint-initdb.d/init.sql
    networks:
      - banco
  frontend:
    image: nginx:1.13
    volumes:
      # Site
      - ./web:/usr/share/nginx/html/
      # configuração do proxy reverso
      - ./nginx/default.conf:/etc/nginx/conf.d/default.conf
    ports:
      - 80:80
    networks:
      - web
    depends_on:
      - app
  app:
    image: python:3.6
    volumes:
      # aplicação
      - ./app:/app
    working_dir: /app
    command: bash ./app.sh
    networks:
      - banco
      - web
      - fila
    depends_on:
      - db
      - queue
  queue:
    image: redis:3.2
    networks: 
      - fila
  worker: 
    build: worker
    volumes:
      # works
      - ./worker:/worker
    working_dir: /worker
    command: worker.py
    networks:
      - fila
    depends_on:
      - queue
````

c - Testando no console

````
$  docker-compose down

$ docker-compose up -d 

$ docker-compose scale worker=3 

$  docker-compose logs -f -t worker 

http://localhost/
````

#### 9 - Boas praticas - Variaveis de ambientes

a - Modificar o sender.py em app

````python
import psycopg2
import redis
import json
import os

from bottle import Bottle, request

class Sender(Bottle):

    def __init__(self):
        super().__init__()
        self.route('/', method='POST', callback=self.send)
         
        redis_host = os.getenv('REDIS_HOST', 'queue')
        self.fila = redis.StrictRedis(host=redis_host, port=6379, db=0)

        db_host = os.getenv('DB_HOST', 'db')
        db_user = os.getenv('DB_USER', 'postgres')
        db_name = os.getenv('DB_NAME', 'sender')
        dsn = f'dbname={db_name} user={db_user} host={db_host}'
        self.conn = psycopg2.connect(dsn)

    def register_message(self, assunto, mensagem):
        SQL = 'INSERT INTO emails (assunto, mensagem) VALUES (%s, %s)'
        cur = self.conn.cursor()
        cur.execute(SQL, (assunto, mensagem))
        self.conn.commit()
        cur.close()

        msg = {'assunto': assunto, 'mensagem': mensagem}
        self.fila.rpush('sender', json.dumps(msg))

        print('Mensagem regitrada!')

    def send(self):
        assunto = request.forms.get('assunto')
        mensagem = request.forms.get('mensagem')

        self.register_message(assunto, mensagem)
        return 'Mensagem enfileirada ! Assunto: {} Mensagem: {}'.format(
            assunto, mensagem
        )

if __name__ == '__main__':
    sender = Sender()
    sender.run(host='0.0.0.0', port=8080, debug=True)
````

b - Personalizar nome do db_name no docker-compose criar um environment em app

````yml
version: '2'
volumes:
  dados:
networks:
  banco:
  web:
  fila:
services:
  db:
    image: postgres:9.6
    volumes:
      # Volume dos dados
      - dados:/var/lib/postgresql/data
      # Scripts
      - ./scripts:/scripts
      - ./scripts/init.sql:/docker-entrypoint-initdb.d/init.sql
    networks:
      - banco
  frontend:
    image: nginx:1.13
    volumes:
      # Site
      - ./web:/usr/share/nginx/html/
      # configuração do proxy reverso
      - ./nginx/default.conf:/etc/nginx/conf.d/default.conf
    ports:
      - 80:80
    networks:
      - web
    depends_on:
      - app
  app:
    image: python:3.6
    volumes:
      # aplicação
      - ./app:/app
    working_dir: /app
    command: bash ./app.sh
    networks:
      - banco
      - web
      - fila
    depends_on:
      - db
      - queue
    environment:
      - DB_NAME=email_sender
  queue:
    image: redis:3.2
    networks:
      - fila
  worker:
    build: worker
    volumes:
      # works
      - ./worker:/worker
    working_dir: /worker
    command: worker.py
    networks:
      - fila
    depends_on:
      - queue
````

c -  Testando console

````
$  docker-compose down

$ docker-compose up -d 

$ docker-compose scale worker=3 

$  docker-compose logs -f -t worker

http://localhost/

╰─➤  docker-compose exec db psql -U postgres -d email_sender -c 'select * from emails'
 id |            data            | assunto |    mensagem
----+----------------------------+---------+-----------------
  1 | 2018-08-26 18:48:58.525861 | terter  | tretetete
  2 | 2018-08-26 19:48:08.126184 | Worker  | testando worker
  3 | 2018-08-26 20:11:29.215893 | fdsf    | fdsfsdfvvv gg
  4 | 2018-08-26 21:13:43.33922  | rwerw   | rwerw
(4 rows)
````

#### 10 - Sobreescrevendo localmente (Override)

a - criarnovo arquivo na raiz chamado docker-compose.override.yml

````yml
version: '2'
services:
  app:
    environment:
      - DB_NAME=email_sender
````

b - no docker-compose oroginal mudar environment para qualquer nome

````yml
    environment:
      - DB_NAME=Emerson_sender
````

c - Testar mudança

````
$  docker-compose down

$ docker-compose up -d 

$ docker-compose scale worker=3 

http://localhost/

╰─➤  docker-compose exec db psql -U postgres -d email_sender -c 'select * from emails'
 id |            data            | assunto |    mensagem
----+----------------------------+---------+-----------------
  1 | 2018-08-26 18:48:58.525861 | terter  | tretetete
  2 | 2018-08-26 19:48:08.126184 | Worker  | testando worker
  3 | 2018-08-26 20:11:29.215893 | fdsf    | fdsfsdfvvv gg
  4 | 2018-08-26 21:13:43.33922  | rwerw   | rwerw
  5 | 2018-08-26 21:22:10.304231 | fsdf    | fsdfsd v v
(5 rows)
````