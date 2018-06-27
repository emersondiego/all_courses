# Usando ARGV

=begin

=== ARGV ====

Argumento Vector

é o que vem de fora da aplicação, permite pegar os parametros externo que vc passa na aplicação

=end

if ARGV.size > 0
    File.open(ARGV[0], 'r') do |arq|
        while line = arq.gets
            puts line
        end
    end
else
    puts "Você deve informar o nome do arquivo a ser aberto. EX: ruby app.rb teste.txt"
end



#### Leitura de arquivo

# File.open('teste.txt', 'r') do |arq|
#     while line = arq.gets
#         puts line
#     end
# end

## imprimi

=begin
╭─emerson@emerson-ote ~/workspace/trainne/cursos/curso_ruby/curso_online/trabalhos_com_arquivos ‹ruby-2.4.0› ‹master*› 
╰─➤  ruby app.rb                                                                1 ↵
Emerson Pereira - Treinamento Ruby
Rails
Ruby



## criando arquivo via IRB - White
2.4.0 :002 > File.open("teste.text", "w") do |arq|
2.4.0 :003 >     arq.puts "Emerson Pereira - Treinamento Ruby"
2.4.0 :004?>   end


## Lendo arquivo via IRB - Read

2.4.0 :010 > File.open('teste.text', 'r') do |arq|
2.4.0 :011 >     while line = arq.gets
2.4.0 :012?>     puts line
2.4.0 :013?>     end
2.4.0 :014?>   end
Emerson Pereira - Treinamento Ruby
Rails
Ruby
 => nil 
 
=end