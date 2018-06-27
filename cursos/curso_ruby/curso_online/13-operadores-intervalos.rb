=begin

Operaradores de intervalo (Range) ajuda a ir de um numero a outro sem muito esforço ex. 1..5 ou 1...5

Representado por:
... # 1...5 informa um range de 1 te 4 vai ate o penultimo elemento
.. # quando preciso ir de numetro ate outro mesmo uso este modelo ex. 1..5 - ira percorrer toda o range, ou seja ate o ultimo elemento 
=end

2.4.0 :002 > a = [1,2,3,4,5]
 => [1, 2, 3, 4, 5]
2.4.0 :003 > a.each { |x| puts x }
1
2
3
4
5
 => [1, 2, 3, 4, 5]
2.4.0 :004 > (1...4).each { |x| puts x} # pode ser dessa forma
1
2
3
 => 1...4
2.4.0 :005 > (1..4).each { |x| puts x} # ou dessa
1
2
3
4
 => 1..4
2.4.0 :006 >