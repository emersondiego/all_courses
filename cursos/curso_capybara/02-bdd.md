# Curso de Automação de Testes com Capybara, Cucumber e Ruby

## AULA 14 - O que é BDD

## BBD - Desenvolvimento Guiado por Comportamento

``
É uma tecnica de desenvolvimento agil que encoraja colaboração entre desenvolvedores, setores de qualidade e pessoas não-tecnicas ou de negócios num projetode SW, se relacina com o conceito de VERIFICAÇÃO e VALIDAÇÃO.
``

### Objetivo

``
BDD são linguaguem e e as interações usadas no processo de desenvolvimento de SW. Desenvolvedores usam sua lingua nativa em combinação de com linguagem ubigua, que lhes permite concentrar nas razões pelas quais os codigos devem ser criados, e não em detalhes tecnicos, além de minimizar traduções entre a linguagem tecnica na qual o codigo é escrito e outras linguagens de dominio, usuarios, clientes, gerencia do projeto, etc.
``

### Usado 

``
Esse tipo de modelo na escrita possibilita a integração de todo time, pois, qualquer membro pode contribuir com a construção de cenrarios. Portanto, essa tecnica aumenta a comunicação e o entendimento do negócio para o time como um todo.
``

### Gerkin

``
Serve como documentação do seu projeto, bem como para testes automatizados. O Cucumber também tem uma caracteristica bonus: ele fala para voicê usando linguagem verdadeira, humana lhe dizendo o código que voÇê escrever.
``

### Cucumber

``
Criado para opoiar o desenvolvimento de testes de aceitação automatizado utilizado a técnica BDD. 
``

### Exemplo - Cenário usando Gerkin (Cucumber)

```ruby
Cenário: Fazer Login com sucesso
Dado que eu tenho um usuário
Quando faço login
Então eu verifico se login foi relaizado com sucesso
```




