=begin
[3] pry(main)> a
=> [1, 2, 3, 4]
[4] pry(main)> a.count
=> 4
[5] pry(main)> a.size
=> 4
[6] pry(main)> a.legth
NoMethodError: undefined method `legth' for [1, 2, 3, 4]:Array
Did you mean?  length
from (pry):6:in `__pry__'
[7] pry(main)> a.length
=> 4
[8] pry(main)> a.push(3) # inclui um novo no final
=> [1, 2, 3, 4, 3]
[9] pry(main)> a.un(3)
a.uniq        a.unshift     a.untrust
a.uniq!       a.untaint     a.untrusted?
[9] pry(main)> a.unshift(9) # inclui um novo no inicio da lista
=> [9, 1, 2, 3, 4, 3]
[10] pry(main)> a.pop # exclui ultima da lista
=> 3
[11] pry(main)> a
=> [9, 1, 2, 3, 4]
[12] pry(main)> a.shift # exclui primeiro da lista
=> 9
[13] pry(main)> a
=> [1, 2, 3, 4]
[14] pry(main)> 

=end


puts "------------------"
puts "|      MENU      |"
puts "------------------"

# se precisar trocar todas "-"

def meu_menu
    puts "------------------"
    puts "|      MENU      |"
    puts "------------------"
end

# chamando metodo
meu_menu
meu_menu

# podemos interpolar o metodo

def meu_menu1(value)
    puts "#{value}#{value}#{value}#{value}#{value}#{value}#{value}"
    puts "|      MENU      |"
    puts "------------------"
end

meu_menu1("x")
meu_menu1("v")
meu_menu1("Y")


def soma(a,b)
    resultado = a + b
    puts "O resulado é #{resultado}!" 
end

soma(4,4)