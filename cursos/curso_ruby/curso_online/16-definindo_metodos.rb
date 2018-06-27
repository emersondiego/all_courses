class Pessoa # declarar classe
    def gritar #declarar metodos
        puts "Uhuullll"
    end

    def agradecer
        puts "Thanks"
    end
end


###############

obj1 = Pessoa.new

obj1.gritar
obj1.agradecer


#imprimiu na tela resultado abaico
# ╭─emerson@emerson-ote ~/workspace/trainne/cursos/curso_ruby/curso_online ‹ruby-2.4.0› ‹master*› 
# ╰─➤  ruby 16-definindo_metodos.rb                                           1 ↵
# Uhuullll
# Thanks


=begin via IRB
╰─➤  irb
2.4.0 :001 > require_relative "16-definindo_metodos"
 => true 
2.4.0 :002 > x = Pessoa.new #instanciando class pessoa na varialvel x
 => #<Pessoa:0x00000002335598> 
2.4.0 :003 > x.gritar # chamando o metodo da class pessoa 
 => nil 
2.4.0 :004 > 
=end