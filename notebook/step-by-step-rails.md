# ===Step by Step===

== Cruds == scaffold (construi os models, controllers e as views e as migrações)

= Tabel King
rails g scaffold Kind description:string

= Tabel Contact
rails g scaffold Contact name:string email:string kind:references rmk:text

= Tabel Address
 rails g scaffold Address street:strinf cidade:string estado:string contact:references
 
 = Tabel Phone
 rails g scaffold Phone phone:string contact:references

## == ORM e Migrations ==
== Mandar esses dados para o BD == MIGRAÇÂO
 ORM = object relational Mapper (fazer a relação dos objetos com os dados que os mesmos representam)
 
 tradução do que escreveu em ruby para o sql.
 
 Quem faz isso: ActiveRecord
 
 Migrations = cria uma tabela, cria um historico que é pra ser criado uma tabela XXX, e estrutura no formato certo.
 
   db/migrate - ira ser apresentada as migrates
 
 Executar:
  rake db:create # pega od dados do database.yml e cria o banco de dados
  
  rake db:migrate # cria as tabelas do banco de dados / migra tudo que não foi migrado para o BD
  
## == Subir aplicação novamente ==
 rails s -p $PORT -b $IP
 
=== Ciclo de Acesso ===

Pasta app

 iteração inicial no navegador na rota é feito pelo controller - ação solicitada pelo usuario, que em seguida chama a view com o mesmo nome 
 
== REVISÂO == 
 criação do projeto
 geração dos scaffolds
 criação do BD
 migração das tabelas 
 acesso aos CRUDs
 
=== Criar telas de boas vindas ===
 De Home partir para outras 
 
   rails g controller home index
   
 Mudando arquivo route
 
   root 'home#index' # determino que essa seja minha pagina padrao quando eu não passar path
   
 
## == Aula 29 - ERB (Embedded Ruby)

Misturando Ruby na pagina html

 <% e  <%=
 
 <% = codigo rudy que nao é mostrado na telas
   <%= = dessa forma é informada na tela
 
 
## == Aula 30 - Helpers  (Ajudantes do Rails)

 Metodos que facilita a vida do desenvolvimento
 
  link_to : transforma os parametros em link usando o href

 Dicas: http://api.rubyonrails.org/
  https://apidock.com/rails
  
  
 Criando um helper 
  Exemplo: Mostrar nome 


## == Aula 31 - Rotas e Rest
 HTTP - Verbos
 GET / POST
 
==Antigamente 
GET - devolve algo (pegar)
POST - enviar algo (manda dados)

== Atualmente
=== Rest === 
  CRUD - POST (create/inserir) GET (Ler/selecionar) PUT(atualizar) DELETE (excluir/deletar)

Recurso = Ex. Contato do nosso exemplo Notebook

== rails/info/routes

http://guides.rubyonrails.org/routing.html#crud-verbs-and-actions


config/routes.rb

## == Aula 32 - Fazendo caixa de seleção


Existe um Helper que permite criar caixa de seleção no rails

collection_select

http://api.rubyonrails.org/v5.2.0/classes/ActionView/Helpers/FormOptionsHelper.html#method-i-collection_select

Sintaxe:
collection_select(object, method, collection, value_method, text_method, options = {}, html_options = {})

## == Aula 33 - Partials - reaproveitar trechos de paginas

 ex. utilizar partes do projeto como um todo, exemplo do header 
 
 usar locals pra conseguir mandar as variaveis pra dentro particial caso precise

 toda particial começa com "_"
 
 arquivos usados nesse aula:
       /app/views/shared/_teste.html.erb
       /app/views/contacts/index.html.erb
       /app/controllers/contacts_controller.rb

## === 34 - melhorando a aparência da aplicação


   HTMl / CSS
   
   https://www.sanwebe.com/2013/10/css-html-form-styles

 Criar na pasta public dois arquivos: form.html e form.css
 
 Mudar o template scaffold que o ruby tras como default
 
  Acessar app/assets/stylesheets
  
  arquivo scaffolds.scss mudar o conteudo para o de form.css
  
  
  http://api.rubyonrails.org/v5.2.0/classes/ActionView/Helpers/FormHelper.html#method-i-form_for
  Informar no _form.html.erb:
  
  form_for(record, options = {}, &block)
  
  baixar imagem para a pasta assets/images
  
  wget https://www.sanwebe.com/wp-content/uploads/2013/10/down-arrow.png
  
  Como não mudou a cor do botão pra vermelho e o nome do formulario no topo da sessão deve ser feito ajustes no _form.html.erb
  
  e tbm jogar o link <back> pra dentro do modal do formulario
  
  Deixar o nome dos textos do campos ao lado
  
  label span
  
## === 35 - Rails Console e Active Record
 
 rails console parece com irb
 
 Ele console trazer a aplicação para vc conseguir debugar
 
 ActiveRecord funciona pela operações crud 
  
 Executando Rails console
 terminal: rails c / console
 

 -- Criando um novo elemento em Kinds / Create <Model>.create/new
 
      Loading development environment (Rails 4.2.5)
     2.3.4 :001 > k = Kind.new
           => #<Kind id: nil, description: nil, created_at: nil, updated_at: nil> 
           
     2.3.4 :003 > k.description = "Novo Tipo"
      => "Novo Tipo" 
      
     2.3.4 :004 > k
      => #<Kind id: nil, description: "Novo Tipo", created_at: nil, updated_at: nil> 
      
     2.3.4 :005 > k.save
        (0.2ms)  begin transaction
       SQL (0.5ms)  INSERT INTO "kinds" ("description", "created_at", "updated_at") VALUES (?, ?, ?)  [["description", "Novo Tipo"], ["created_at", "2018-06-24 23:28:35.768313"], ["updated_at", "2018-06-24 23:28:35.768313"]]
        (16.3ms)  commit transaction
      => true 
      
     2.3.4 :006 > k
      => #<Kind id: 5, description: "Novo Tipo", created_at: "2018-06-24 23:28:35", updated_at: "2018-06-24 23:28:35"> 
      
      2.3.4 :007 > k1 = Kind.create(description: "Novo Tipo2")
        (0.1ms)  begin transaction
       SQL (0.4ms)  INSERT INTO "kinds" ("description", "created_at", "updated_at") VALUES (?, ?, ?)  [["description", "Novo Tipo2"], ["created_at", "2018-06-24 23:32:19.103813"], ["updated_at", "2018-06-24 23:32:19.103813"]]
        (11.7ms)  commit transaction
      => #<Kind id: 6, description: "Novo Tipo2", created_at: "2018-06-24 23:32:19", updated_at: "2018-06-24 23:32:19"> 
      
     2.3.4 :008 > k1
      => #<Kind id: 6, description: "Novo Tipo2", created_at: "2018-06-24 23:32:19", updated_at: "2018-06-24 23:32:19"> 
     
 -- Para ler Read <Model>.all/first/where para fazer pesquisas
 
     2.3.4 :009 > Kind.all
      Kind Load (0.4ms)  SELECT "kinds".* FROM "kinds"
     => #<ActiveRecord::Relation [#<Kind id: 1, description: "Amigos", created_at: "2018-06-04 18:12:22", updated_at: "2018-06-04 18:12:56">, #<Kind id: 2, description: "Comércio", created_at: "2018-06-04 18:12:39", updated_at: "2018-06-04 18:12:39">, #<Kind id: 3, description: "Contato", created_at: "2018-06-04 18:12:47", updated_at: "2018-06-04 18:12:47">, #<Kind id: 5, description: "Novo Tipo", created_at: "2018-06-24 23:28:35", updated_at: "2018-06-24 23:28:35">, #<Kind id: 6, description: "Novo Tipo2", created_at: "2018-06-24 23:32:19", updated_at: "2018-06-24 23:32:19">]> 
     
    2.3.4 :010 > Kind.first
      Kind Load (0.3ms)  SELECT  "kinds".* FROM "kinds"  ORDER BY "kinds"."id" ASC LIMIT 1
     => #<Kind id: 1, description: "Amigos", created_at: "2018-06-04 18:12:22", updated_at: "2018-06-04 18:12:56"> 
     
    2.3.4 :011 > Kind.last
      Kind Load (0.3ms)  SELECT  "kinds".* FROM "kinds"  ORDER BY "kinds"."id" DESC LIMIT 1
     => #<Kind id: 6, description: "Novo Tipo2", created_at: "2018-06-24 23:32:19", updated_at: "2018-06-24 23:32:19"> 
     
    2.3.4 :012 > Kind.where(description: "Amigos")
      Kind Load (0.3ms)  SELECT "kinds".* FROM "kinds" WHERE "kinds"."description" = ?  [["description", "Amigos"]]
     => #<ActiveRecord::Relation [#<Kind id: 1, description: "Amigos", created_at: "2018-06-04 18:12:22", updated_at: "2018-06-04 18:12:56">]> 
    2.3.4 :013 > 
     
 -- Update Encontrar e salvar 
    <Model>.find / save
    <Model>.find / update
    <Model>.update_all "field = value" - atualiza todasos elementos iguais 
    
     2.3.4 :013 > x = Kind.find(3)
     Kind Load (0.4ms)  SELECT  "kinds".* FROM "kinds" WHERE "kinds"."id" = ? LIMIT 1  [["id", 3]]
      => #<Kind id: 3, description: "Contato", created_at: "2018-06-04 18:12:47", updated_at: "2018-06-04 18:12:47"> 
      
     2.3.4 :014 > x.description = "CONTATO"
      => "CONTATO" 
     2.3.4 :015 > x
      => #<Kind id: 3, description: "CONTATO", created_at: "2018-06-04 18:12:47", updated_at: "2018-06-04 18:12:47"> 
      
     2.3.4 :016 > x.save
        (0.2ms)  begin transaction
       SQL (0.4ms)  UPDATE "kinds" SET "description" = ?, "updated_at" = ? WHERE "kinds"."id" = ?  [["description", "CONTATO"], ["updated_at", "2018-06-24 23:42:33.985399"], ["id", 3]]
        (9.1ms)  commit transaction
      => true 
      
     2.3.4 :018 > x
      => #<Kind id: 3, description: "CONTATO", created_at: "2018-06-04 18:12:47", updated_at: "2018-06-24 23:42:33"> 
     
     2.3.4 :020 >   x.update(description: "Amigo")
        (0.2ms)  begin transaction
       SQL (0.3ms)  UPDATE "kinds" SET "description" = ?, "updated_at" = ? WHERE "kinds"."id" = ?  [["description", "Amigo"], ["updated_at", "2018-06-24 23:43:57.659421"], ["id", 3]]
        (9.3ms)  commit transaction
      => true 
      
     2.3.4 :021 > x
      => #<Kind id: 3, description: "Amigo", created_at: "2018-06-04 18:12:47", updated_at: "2018-06-24 23:43:57"> 
 
 
 -- Delete 
  <Model>.find / destroy
  
        2.3.4 :028 >   x = Kind.last
        Kind Load (1.6ms)  SELECT  "kinds".* FROM "kinds"  ORDER BY "kinds"."id" DESC LIMIT 1
       => #<Kind id: 6, description: "Novo Tipo2", created_at: "2018-06-24 23:32:19", updated_at: "2018-06-24 23:32:19"> 
       
      2.3.4 :029 > x.destroy
         (0.1ms)  begin transaction
        SQL (0.4ms)  DELETE FROM "kinds" WHERE "kinds"."id" = ?  [["id", 6]]
         (10.4ms)  commit transaction
       => #<Kind id: 6, description: "Novo Tipo2", created_at: "2018-06-24 23:32:19", updated_at: "2018-06-24 23:32:19"> 

-- x.times ( criar varios elementos de uma vez só)

         2.3.4 :040 >   5.times do |i|                                                                                                                          
       2.3.4 :041 >     Kind.create(description: "Novo Tipo - #{i}.to_s")
       2.3.4 :042?>   end
          (0.2ms)  begin transaction
         SQL (0.4ms)  INSERT INTO "kinds" ("description", "created_at", "updated_at") VALUES (?, ?, ?)  [["description", "Novo Tipo - 0.to_s"], ["created_at", "2018-06-24 23:51:12.322477"], ["updated_at", "2018-06-24 23:51:12.322477"]]
          (10.0ms)  commit transaction
          (0.1ms)  begin transaction
         SQL (0.3ms)  INSERT INTO "kinds" ("description", "created_at", "updated_at") VALUES (?, ?, ?)  [["description", "Novo Tipo - 1.to_s"], ["created_at", "2018-06-24 23:51:12.335126"], ["updated_at", "2018-06-24 23:51:12.335126"]]
          (9.7ms)  commit transaction
          (0.1ms)  begin transaction
         SQL (0.3ms)  INSERT INTO "kinds" ("description", "created_at", "updated_at") VALUES (?, ?, ?)  [["description", "Novo Tipo - 2.to_s"], ["created_at", "2018-06-24 23:51:12.346943"], ["updated_at", "2018-06-24 23:51:12.346943"]]
          (8.7ms)  commit transaction
          (0.1ms)  begin transaction
         SQL (0.3ms)  INSERT INTO "kinds" ("description", "created_at", "updated_at") VALUES (?, ?, ?)  [["description", "Novo Tipo - 3.to_s"], ["created_at", "2018-06-24 23:51:12.357789"], ["updated_at", "2018-06-24 23:51:12.357789"]]
          (7.7ms)  commit transaction
          (0.1ms)  begin transaction
         SQL (0.3ms)  INSERT INTO "kinds" ("description", "created_at", "updated_at") VALUES (?, ?, ?)  [["description", "Novo Tipo - 4.to_s"], ["created_at", "2018-06-24 23:51:12.367681"], ["updated_at", "2018-06-24 23:51:12.367681"]]
          (9.3ms)  commit transaction
        => 5 
       
       2.3.4 :043 > Kind.all
         Kind Load (0.4ms)  SELECT "kinds".* FROM "kinds"
        => #<ActiveRecord::Relation [#<Kind id: 1, description: "Amigos", created_at: "2018-06-04 18:12:22", updated_at: "2018-06-04 18:12:56">, #<Kind id: 2, description: "Comércio", created_at: "2018-06-04 18:12:39", updated_at: "2018-06-04 18:12:39">, #<Kind id: 3, description: "Amigo", created_at: "2018-06-04 18:12:47", updated_at: "2018-06-24 23:43:57">, #<Kind id: 5, description: "Novo Tipo", created_at: "2018-06-24 23:28:35", updated_at: "2018-06-24 23:28:35">, #<Kind id: 7, description: "Novo Tipo - 0.to_s", created_at: "2018-06-24 23:51:12", updated_at: "2018-06-24 23:51:12">, #<Kind id: 8, description: "Novo Tipo - 1.to_s", created_at: "2018-06-24 23:51:12", updated_at: "2018-06-24 23:51:12">, #<Kind id: 9, description: "Novo Tipo - 2.to_s", created_at: "2018-06-24 23:51:12", updated_at: "2018-06-24 23:51:12">, #<Kind id: 10, description: "Novo Tipo - 3.to_s", created_at: "2018-06-24 23:51:12", updated_at: "2018-06-24 23:51:12">, #<Kind id: 11, description: "Novo Tipo - 4.to_s", created_at: "2018-06-24 23:51:12", updated_at: "2018-06-24 23:51:12">]> 
       2.3.4 :044 > 
       
 -- rake db:drop (tchau db), apaga BD todo
 
 
## === 36 - Seeds.rb e Rake Tasks

 db/seeds.rb
 
 Apagar o banco de dados todos pra entender
 
  rake db:drop - apaga o schema do bando de dados
  
  Em seguida recriar banco
  
  rake db:create - recriar o banco
  
  rake db:migrate - recriar as tabelas
  
  
  rake - automatizar tarefas
  
  Para ver as tarefas no rake
  
   rake -T
   
   
  rake db:seeds - carrega as informações informada no seeds.rb, para auxiliar no desenvolvimento. Ex. Incluir dados fake no DB

Usaremos a gem faker para gerar nomes aleatorios no seeds
   
## === 37 - Criando suas próprias Rake Tasks

 