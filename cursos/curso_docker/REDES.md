## Tipos de redes

Padrão do docker é o bridge

- None Network  

- Bridge Network (padrão)

- Host Network

- Overlay Nertwork (Swarm)

Terminal:

$ docker network ls

saida terminal:

````
╰─➤  docker network ls
NETWORK ID          NAME                 DRIVER              SCOPE
cd29299e7c81        bridge               bridge              local
99f0a8ea8247        host                 host                local
0373a1fc8da7        none                 null                local
````

### Rede tipo None (sem rede)

Criando:
$ docker container run -d --net none debian

Exemplo de container com rede:

````
╰─➤  docker container run --rm alpine ash -c "ifconfig"
Unable to find image 'alpine:latest' locally
latest: Pulling from library/alpine
8e3ba11ec2a2: Pull complete
Digest: sha256:7043076348bf5040220df6ad703798fd8593a0918d06d3ce30c6c93be117e430
Status: Downloaded newer image for alpine:latest
eth0      Link encap:Ethernet  HWaddr 02:42:AC:11:00:02
          inet addr:172.17.0.2  Bcast:0.0.0.0  Mask:255.255.0.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:3 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:310 (310.0 B)  TX bytes:0 (0.0 B)

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
````

Sem rede, com none:

````
╰─➤  docker container run --rm --net none  alpine ash -c "ifconfig"
lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

````

### Rede tipo Bridge

Terminal:

$ docker network inspect bridge

````
╰─➤  docker network inspect bridge                                                                              1 ↵
[
    {
        "Name": "bridge",
        "Id": "cd29299e7c81c6661f04840923b41d922f8a926823251f00c810c58904ad97f8",
        "Created": "2018-08-20T20:30:58.006830475-03:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.17.0.0/16",
                    "Gateway": "172.17.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "Containers": {},
        "Options": {
            "com.docker.network.bridge.default_bridge": "true",
            "com.docker.network.bridge.enable_icc": "true",
            "com.docker.network.bridge.enable_ip_masquerade": "true",
            "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
            "com.docker.network.bridge.name": "docker0",
            "com.docker.network.driver.mtu": "1500"
        },
        "Labels": {}
    }
]
````

Acessar outro container a partir do ping:

$ docker container run -d --name container1 alpine sleep 1000

$ docker container exec -it container1 ifconfig
inet addr: 172.17.0.2

$ docker container run -d --name container2 alpine sleep 1000

$ docker container exec -it container1 ifconfig
inet addr: 172.17.0.3

Testa conexetividade:

$ docker container exec -it container1 ping 172.17.0.3

$ docker container exec -it container1 ping www.google.com

#### Criar nova rede

$ docker network create --driver bridge rede_nova

$ docker network ls 

$ docker network inspect rede_nova

$ docker container run -d --name container3 --net rede_nova alpine sleep 1000

$ docker container exec -it container3 ifconfig

$ docker container inspect container1
pegar ip

A partir do container 3 pingar container 3:

$ docker container exec -t container3 ping 172.1.0.2

Não ira conseguir pingar pois são duas redes diferentes

Vamos configurar o container3 para se conexao a rede brigde 

$ docker network connect bridge container3

Verificar conexao:

$ docker container exec -it container3 ifconfig

Testar conexitividade novamente

$ docker container exec -t container3 ping 172.1.0.2

Podemos desconectar essa rede brigde criada

$ docker network disconnect bridge container3

Listar:

$ docker container exec -it container3 ifconfig

### Rede tipo Host

Não ter o brigde como intermediario

Terminal:

$ docker container run -d --name container4 --net host alpine sleep 1000

$ docker container exec -it container4 ifconfig