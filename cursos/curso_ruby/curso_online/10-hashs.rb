=begin

IRB

2.4.0 :011 > v = [1,2,3,4,5]
 => [1, 2, 3, 4, 5] 
2.4.0 :012 > v
 => [1, 2, 3, 4, 5] 
2.4.0 :013 > h = {"a"=>"123", "b"=>"456"}
 => {"a"=>"123", "b"=>"456"} 
2.4.0 :014 > h
 => {"a"=>"123", "b"=>"456"} 
2.4.0 :015 > v
 => [1, 2, 3, 4, 5] 
2.4.0 :016 > h
 => {"a"=>"123", "b"=>"456"} 
2.4.0 :017 > h.class
 => Hash 
2.4.0 :018 > h["a"]
 => "123" 
2.4.0 :019 > h["b"]
 => "456" 
2.4.0 :020 > ou
NameError: undefined local variable or method `ou' for main:Object
	from (irb):20
	from /usr/share/rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :021 > h = {a: "123", b: "456"}
 => {:a=>"123", :b=>"456"} 
2.4.0 :022 > h
 => {:a=>"123", :b=>"456"} 
2.4.0 :023 > h[:a]
 => "123" 
2.4.0 :024 > h[:b]
 => "456" 

=end