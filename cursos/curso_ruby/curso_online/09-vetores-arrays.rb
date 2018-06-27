=begin
- [] uso dos braquetes

╭─emerson@emerson-ote ~/workspace/trainne/cursos/curso_ruby/curso_online ‹ruby-2.4.0› ‹master*› 
╰─➤  irb                                                                    1 ↵
2.4.0 :001 > v = []
 => [] 
2.4.0 :002 > v.push(5)
 => [5] 
2.4.0 :003 > v.push(5)
 => [5, 5] 
2.4.0 :004 > v.push(8)
 => [5, 5, 8] 
2.4.0 :005 > v[2] = 4
 => 4 
2.4.0 :006 > v
 => [5, 5, 4] 
2.4.0 :007 > v[1] = 3
 => 3 
2.4.0 :008 > v
 => [5, 3, 4] 
2.4.0 :009 > v.delete(4)
 => 4 
2.4.0 :010 > v
 => [5, 3] 
2.4.0 :011 > 

=end

v = []

v.push(1)
v.push(78)

puts v