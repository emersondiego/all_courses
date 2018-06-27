h = {"a" => 123, "b" => 456}

puts h.class 
puts h.inspect
puts h
puts h["a"]
puts h["b"]

h.merge!({"Emerson" => "Alves"}) # inclui um novo elemento dentro do hash
puts h