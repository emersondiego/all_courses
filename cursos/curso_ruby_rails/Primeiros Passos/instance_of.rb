#instance_of - instancia de...

a = 123

puts a.class

#teste no pry

=begin
    ─emerson@emerson-ote ~/workspace/trainne/cursos/curso_ruby_rails ‹ruby-2.4.0› ‹master*› 
╰─➤  pry
[1] pry(main)> a = 123
=> 123
[2] pry(main)> a.instance_of(A
ARGF           ARGV           ArgumentError  Array          
[2] pry(main)> a.instance_of(A
ARGF           ARGV           ArgumentError  Array          
[2] pry(main)> a.instance_of(Array)
NoMethodError: undefined method `instance_of' for 123:Integer
Did you mean?  instance_of?
from (pry):2:in `__pry__'
[3] pry(main)> a.instance_of?(Array)
=> false
[4] pry(main)> a.instance_of?(Fixnum)
(pry):4: warning: constant ::Fixnum is deprecated
=> true
=end

def mostrar(a)
    if a.instance_of?(String)
        puts a
    end

    if a.instance_of?(Array)
        a.each do |i|
            puts ">>#{i}"
        end
    end
end

puts mostrar("Emerson")
puts "-----------------"
puts mostrar([1,2,3]).inspect