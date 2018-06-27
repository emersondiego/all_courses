=== ParadigmasOO ===

Conceitos, como:

classes
objetos
encapsulamento
herança ...

=== Historico ===

Anos  60  linguagem SIMULA67
Primeira linguagem OO Smalltalk anos 70 - Noruega

Alan Kay fundador do Smalltalk
    celula interage com outro celula e se comunicam 
    Forma geral, construir um sofwares a partir de agentes autonomos para se interagir


=== Pilalares da OO ===

- abstração: imaginar o objeto - identidade unica / atributos / metodos
- encapsulamento: enconder propriedade dos objetos para obter segurança 
- herença: permite o reuso de codigo
- polimorfismo: é a capacidade de referenciar um objeto de varias formas diferentes

=== Classes ===
Classe é um gabarito pra definir um objeto  (uma forma)

Definindo uma classe voce consegue ter a priedades / atributos e metodos / acoes para o objeto

Resumo
- uma classe representa um conjunto de objetos com caracteristicas afins
- difine comportamento dos objetos atraves de seus metodos, e quais estados ele é capaz de manter 
atraves de seus atributos

Entidade fisica: caminhao, carro, bike
Entidade conceitual: processo quimico, matricula
entidade de sw: lista encadeada, arquivo

Ex. Classe Lampada

Atributos: potencia, vontagem - caracteristicas comum
Acoes: ligar e desligar 

Representado graficamente

Nome Classe                     
Atributos Classe
Metodo da Classe

Conta 
-saldo:  float 0.0
-numero string: string

+debitar (float: valor)
+creditar (float: valor)
+transferir (float: valor)
+consultar()

=== Encapsulamento ===
é esconder os dados dentro do objeto
    de duas visões: interna (como o obejto faz) e externa (o que o objeto faz)
    Ex. maquina de refrigerante
    Sabemos que ao colocar moeda o refri ira sair
    E temos a parte interna que não sabemos como ele soube escolher o refri certo e assim por diante

Temos mofificadores de acessos: 
(+)publicos: que podem ser acessados de outra classe
(-)privados: que somente podem ser acessado pela propria classe
protegidos: podem ser acessadas por sua propria classe e por suas decendentes (hieranquia)
    
=== Objeto ===
classes são fabricas de objeto  
Objeto sao instancia de uma classe

objeto é capaz de armazenar status atraves de seus atributos e reagir as mensagens enviadas a ele.


Exercios 1 

Classe Tablet           Ex1             Ex2
Atrib.  Marca(String)           Samsung         LG
        Modelo(String)          xptp            abcd
        cor(String)             preta           branco
metod.  Ligar(string: valor)        
        Carregar()
        ConectWifi(string: pass)  

Classe Boleto
Atrib.  Nome (String)
        Endereço(String)
        Valor (float)
metod.  pagar()
        alterar vencimento (string)


Objetos é o que retorna, em nosso exemplo no que foi instanciado acima Samsung Lg

=== Definicação de Classes ===

como definir uma classe em ruby
Exemplo 15


=== Definir metodos (ações da classe) ===
Exemplo 16
        
== Herença entre classes ===
Uso do "<"

Exemplo:

classFilha < ClassePai

SubClass < SuperClass

=== Method Overriding ===
Subscrita de metodos


=== Super ===
Invoca o metodo correspondente na classe partir


=== Self ====
palavra reservada que da acesso ao objeto corrente (sempre que utilizar o obj.meth estamos enviando o metodo para o objeto )
self - ele proprio
Contexto - pode ser algo deferente

=== metdos de instancia vs metodos de classes ===


def method
end

def self.method
end 

=== Constantes e Classes Constantes ===
Declar uma variavel com letra maiscula o torna uma constante.
Exemplo: A = 1 , B = 2

diferença entre variavel e constante:
variavel - vc declara com letras minusculas -  tem proposito de mudar sempre
constante - vc declara com letras maisculas

Constantes é algo que não vai mudar, valor constante. Exemplo valor de PI 
utilizado para um valor que nao vai ser alterado

=== Modulos ===

Modulos sao similares a classes: metodos, constantes, etc

Pode ser declarado dentro do modulo outros modulos.

Modulos sao bons lugarea para armazenar Constantes        

=== Mixins ====

Herança vs Mixins

Herança multiplas  herdar de demais de uma classe

Necessario usar mixins - misturar classes e modulos

=== Pilares da Programação Orientada Objeto === Recapitular

Abstração
        Imaginar objeto: identificação unica; atributos; metodos  
Encapsulamento
        Enconder as propriedades dos objetos para obter segurança   
Herança
        Permite o reuso de codigo
Polimorfismo
        É a capacidade de referenciar um objeto de varias formas diferentes (duck typing e Overriding)

=== Reabrindo Classes = Monkey Patch ===

Incluir metodos nas lib do Ruby, ou mesmo alterar alguma existente.

        Ex. size / equal 


=== ARGV ====

Argumento Vector

é o que vem de fora da aplicação

ex. ver curso_online/trabalhos_com_arquivos/app.rb


=== Executando comandos do sistema operacional atraves do Ruby ===
        ver exemplo em /curso_online/jogos/adivinhar_numero_new/lib/inicializacao.rb


=== ASCII Art ===

Desenhar a partir de letras no terminal

ver /curso_online/jogos/adivinhar_numero_new/ascii
/curso_online/jogos/adivinhar_numero_new/lib/inicializacao.rb


=== Gems para trabalhar em terminal === 

https://piotrmurach.github.io/tty/

tty-cursor - movimentar o cursor no terminal

seta no Gemfile e  o require e em seguida ver doc de como chamar 


=== Criar um jogo da Forca === Projeto Final

