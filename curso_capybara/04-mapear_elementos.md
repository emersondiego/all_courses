# Mapear Elementos com CssSelector e Xpath

## Aula 23 - Trabalhando com Xpath

```
Plugin Chrome util: Xpath Helper
O Xpath usa expressões de caminha para selecionar nós ou conjuntos de nós em um documento XML. O nó é selecionado seguindo um caminho ou etapas.
```

Exemplos de Nós

- NODENAME Seleciona todos os nós com o nome "NODENAME"
- / Seleciona do nó raiz
- // Seleciona nós no documento a partir do nó atual que corresponde à seleção, não importa onde eles estejam
- . Seleciona o nó atual
- .. Seleciona o pai do nó atual
- @ Seleciona atributos

Predicados

```
Os predicados são usados para localizar um nó específico ou um nó que contém um valor específico
Predicados são sempre embutidos em colchetes
```

Exemplo:

- /bookstore/book[1] - Seleciona o primeiro element do livro que é filho do elemento da libraria
- /bookstore/book[last()] - Seleciona o ultimo elemento do livro que é o filho do elemento da livraria
- /bookstore/book[last()-1] - Seleciona o ultimo, mas um elemento de livro que é filho do elemento da livraria
- /bookstore/book[position()<3] - Seleciona os dois primeiros elementos do livro que são filhos do elemento da livraria

- //title[@lang] - Seleciona todos os elementos do tirulo que possuem um atributo chamado lang
- //title[@lang='EN'] - Seleciona todos os elementos de titulo que possuem um atributo "lang" com valor "EN"
- /bookstore/book[price>35.00] - Seleciona todos os elementos do livro do elemento da livraria que tem um elemento preço com um valor maior que 35,00
- /bookstore/book[price>35.00]/title - Seleciona todos os elementos de titulo dos elementos do livro do elemento da libraria que tem um elemento de preço om um valor maior que 35,00

Pratica:

```html
<a id="teste" class="waves-light btn" onclick="ativaedesativa1()"><i class="material-icons left">cloud</i>button</a>

Pegar um elemento que tenha um id="teste":
//a[@id="teste"]
````

```html
<a class="btn red" data-method="get" href="/treinamento/home">Voltar</a>

Procura tag que seja "a" que possua uma "class" com nome "btn red" 
//a[@class="btn red"]
```

Link util:

``
https://www.w3schools.com/xml/xpath_syntax.asp
``

## Aula 24 - Trabalhando com CssSelector

```
Em CSS, os seletores são padrões usados para selecionar o (s) elemento (s) que deseja estilizar
```

Exemplos:

- Seleção por Classe (.classe)

Encontrar um elemento pelo nome da classe basta colocar o valor da classe com um ponto "." na frente ou colocar a tag.classe

- Seleção por ID (#identificador)

Encontrar um elemento por ID basta colocar o valor do atributo ID com um # na frente

- Seleção por elementos (div)

Seleciona todos os elementos < p > onde o pai é um elemento < div >

- Seleção por atributo (elemento[atributo="valor"])

Seleciona todos os elementos com um elemento e um atributo de destino

- Seleção por filho (:first-child)

Seleciona o elemento < p > que é o primeiro filho de seu pai

- Seleção por primeiro elemento (:first-of-type)

Seleciona o elemento < p > que é o primeiro elemento de seu pai

Link Util:

``
https://www.w3schools.com/cssref/css_selectors.asp
``

Pratica:

```html
<a id="teste" class="waves-light btn" onclick="ativaedesativa1()"><i class="material-icons left">cloud</i>button</a>
```

Console navegador

```
$('a[id"teste"]')
```

```html
<a class="waves-teal btn-flat" onclick="ativaedesativa3()">Button</a>
```

Console navegador

```
$('a[onclick="ativaedesativa3()"]')
```

Exemplo de ID que muda:

```html
<a class="btn-floating btn-large waves-light red" onclick="ativaedesativa2()"><i class="material-icons">add</i></a>
```

Console navegador

```
$('a[onclick="ativaedesativa2()"]')
```