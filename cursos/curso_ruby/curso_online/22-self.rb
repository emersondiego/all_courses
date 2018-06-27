class Teste
    def meu_self
        puts "Esse é meu self: #{self}"
    end
end

class Teste1
    def meu_self
        puts "Esse é meu self: #{self}"
    end
end


t = Teste.new
t.meu_self

t1 = Teste1.new
t1.meu_self

=begin
╭─emerson@emerson-ote ~/workspace/trainne/cursos/curso_ruby/curso_online ‹ruby-2.4.0› ‹master*› 
╰─➤  ruby 22-self.rb                                                        1 ↵
Esse é meu self: #<Teste:0x0000000086c108>
Esse é meu self: #<Teste1:0x0000000086f3f8>
   
=end