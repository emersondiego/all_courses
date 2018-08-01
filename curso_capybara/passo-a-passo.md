# Curso de Automação de Testes com Capybara, Cucumber e Ruby

### AULA 3  - Conf. Linux

Default 

	sudo apt-get update

	Atualizar dependencias

	sudo apt-get install autoconfbison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-de
	

1 - Instalar git

	sudo apt-get install git

2 - Instalar gerenciador de versões do Ruby

	git clone https://github.com/rbenv/rbenv.git ~/.rbenv
	echo 'export path="$home/.rbenv/bin:$path"' >> ~/.bashrc
	echo 'eval"$(rbenvinit-)"' >> ~/.bashrc
	source ~/.bashrc

3 - Instalar o Ruby Build - Facilitador de instação do Ruby

	git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

4 - Instalar versões do Ruby    

	rbenv install -l 
	rbenv install 2.4.2
	rbenv global 2.4.2
	ruby -v

5 - Instalar o bundler - controladora de depêndencias do Ruby

	gem install bundler

### AULA 4 - Conf. MAC
1 - Instalar o Homebrew (mac ja vem com ruby instalado - versao antiga)

	ruby-e "$(curl-fsslhttps://raw.githubusercontent.com/homebrew/install/master/install)"

2 - Instalar o Rbenv

	brew install rbenv ruby-build
	echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
	source ~/.bash_profile

3 - Instalar versão do ruby

	rbenv install 2.4.2 
	rbenv global 2.4.2
	ruby -v

4 - Instalar o Bundler 

	gem install bundler

### AULA 5 - Instalando VSCODE e plugins
	Instalar o plugin ruby (Peng Lv)
	Instalar o plugin do cucumber - (Aravind Kumar e Euclidity)
	Instalar o plugin vscode icons (Roberto Huertas)

### AULA 6 - O que é Ruby

	Teoria - Ver video

### AULA 7 - Ruby básico (parte 1)

	IRB - Console onde podemos executar ações/ testar, etc

Tipo de Variaveis:

	Inteiro
	Float
	String
	boleano   

1 - Primeiro código

	Dentro irb:
	puts "Hello World"  

2 - Operadores Simples

	+ adição
	- subtração
	* multiplicação
	/ divisao
	% modulo (pega o resto da divisao)
	** exponenciação (2 elevado a 2)

Exemplos:

	puts 2 + 2
	puts 2 - 2
	puts 2 * 2
	puts 10 / 2
	puts 11 % 2
	puts 2 ** 2

3 - Gets e Puts

	GETS - sever para ler tudo que é inserido
	PUTS - imprimi resultado na tela

Exemplo:

	puts "Meu nome é: "
	variavel = gets.chomp
	puts "O meu nome é #{variavel}."

4 - Interpolação

	interpolação = 1

	#{interpolação}

Exemplo: 

	variavel = "Emerson"

	puts "Ola #{variavel}"

	puts "Ola " << variavel

	variavel_inteira = 2
	variavel_string = "Total é:"

	puts "#{variavel_string} #{variavel_inteira}"

5 - Coersão Cast

	to_i - converte em inteiro
	to_f - converte em float
	to_s - converte em string
	to_a - converte em array
	to_sym - converte em simbolo

Exemplo:

	variavel = "1"
	variavel2 = 2
	puts variavel.to_i + variavel2

### AULA 8 - Ruby básico (parte 2)
1 - Operadores relacionais

	> Maior
	< Menor
	>= Maior ou igual
	<= Menor ou igual
	== igual
	!= diferente 
	<=> Spaceship (O resultado disso sempre da:
		-1 (Quando o elemento da direita é maior que a esquerda)
		0 (Quando os elementos são iguais) e
		1 (Quando o elemento da esqueda é maior que o da direita)
	) 

Exemplos:

	puts  "2 é maior que 1 #{2>1}" #true
	puts  "2 é menor que 1 #{2<1}"  #false
	puts  "2 é igual a 2 #{2 == 2}" #true
	puts  "2 for maior igual 1 #{2>=1}" #true 
	puts  "2 for menor igual a 1 #{2<=1}" #false 
	puts  "2 for diferente de 1 #{2 !=1 }" #true
	puts  "Lado esquerdo for menor que o lado direito #{2 <=> 3}" #-1
	puts  "Lado esuqedo for igual ao direito #{2 <=> 2}" #0
	puts  "Lado esuqedo maior que o direiro #{3 <=> 2}" #1

2 - Operadores de atribuição

	A = A + 4 - Atribui um valir a uma variavel
	A += 4 - Equivale "A = A + 4" 
	A -= 4 - Equivale "A = A - 4" 
	A *= 4 - Equivale "A = A * 4"
	A %= 4 - Equivale "A = A % 4" 
	A /= 4 - Equivale "A = A / 4" 
	A **= 4 - Equivale "A = A ** 4" 

Exemplos:

	a = 2 
	# a = a + 1
	a += 1
	puts a

	b = 2
	# b = b + 1
	b -= 1 #maneira mais facil de passar
	puts b
	...

3 - Estrutura de Condicionais

IF

	if (condicao 1)
		instrucao 1
	else
		instrucao 2
	end

Exemplo: 
	puts "Digite um 1 ou 2"

	v1 = gets.to_i

	if v1 == 1
		puts "O valor é 1"
	elsif v1 == 2
		puts "O valor é 2"
	else
		puts "Valor nao é igual a 1 ou 2"
	end

UNLESS - se condição for falsa

	unless (condicao)
		instrucao 1
	else 
		instrucao 2
	end

Exemplo:

	puts "Digite um numero....."
	v2 = gets.to_i

	unless v2 == 2
		puts "Condicao falsa"
	else
		puts "Condicão verdadeira"
	end
	
CASE WHEN
	case numero
	when 0
		puts "Voce digitou zero"
	when 1..20 
		puts "Digitou entre 1 a 20"
	when 21..70
		puts "Digitou entre 21 a 70"
	else 
		puts "Voce nao digitou um numero"
	end

Exemplo: 

	puts "Digite um numero....."
	v3 = gets.to_i

	case v3
	when 0
		puts "Voce digitou zero"
	when 1..20 
		puts "Digitou entre 1 a 20"
	when 21..70
		puts "Digitou entre 21 a 70"
	else 
		puts "Voce nao digitou um numero"
	end

4 - Operadores Logicos

	&& equivale a "E"
	|| equivale a "OU"
	! equivale a "NEGACAO"

	boleano (true ou false)

Exemplo:

	l1 = 1
	l2 = 2
	l3 = 3
	l4 = 4

	puts ">>>>>> Retorna Verdadeiro"


	if (l1 < l2) && (l3 < l4)
		puts "Condicão atendida pelos dois casos"
	else
		puts "Condicão não atendida"
	end 

	puts ">>>>>> Retorna Falso"

	if (l1 < l2) && (l3 > l4)
		puts "Condicão atendida pelos dois casos"
	else
		puts "Condicão não atendida"
	end 


	puts ">>>>>> Uma das duas precisa dar verdadeira pra dar como atendida"

	if (l1 < l2) || (l3 > l4)
		puts "Condicão por um dos casos"
	else
		puts "Condicão não atendida"
	end 

	puts ">>>>>> Duas conducões invalidas"

	if (l1 > l2) || (l3 > l4)
		puts "Condicão por um dos casos"
	else
		puts "Condicão não atendida"
	end 

	puts ">>>>>> NEGANDO" 

	if !(l3 < l4)
		puts "Negação atendida"
	else
		puts "Negação não atendida"
	end

### AULA 9 - Ruby básico (parte 3)

1 - Estrutura de repetição

	While - enquanto o teste for verdadeiro vai fazer o bloco de repetição
	Until - enquanto for falso vai executar a ação

Exemplo:
	