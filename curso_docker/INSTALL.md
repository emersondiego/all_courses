## Instalação - Visão Geral

Instalando Docker no Windows

````
https://store.docker.com/editions/community/docker-ce-desktop-windows

- Baixar Docker - Get Docker
Ter o Windws 10 atualizada

- Caso não tenha a versão atualizado do Windows 
Vaixar a versão toolbox 
https://docs.docker.com/toolbox/overview/

1 - Seguir com instalador de instalaçÃo padrão

2 - Após instalação ideial reiniciar a maquina

3 - Toolbox é criado tres itens (Docker Quickstart)

4 - Para versao atualizada Docker for Windows
````

Instalando Docker no Mac

````
https://store.docker.com/editions/community/docker-ce-desktop-mac - instalação mais recente ou 

https://docs.docker.com/toolbox/overview/ para instalação mais antigas do mac
````

Instalando Docker no Linux

````
Linux Ubuntu
url: https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository

1 - sudo apt-get update

2 - sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

3 - curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

4 - Baseado na arquitetura 32/64

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

5 - sudo apt-get update

6 - sudo apt-get install docker-ce

7 - Teste
docker --help
````