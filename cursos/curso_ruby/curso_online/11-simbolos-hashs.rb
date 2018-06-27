=begin
simbolos sao strings estaticas
=end

2.4.0 :025 > "emerson".object_id # string valor de memoria sempre muda
 => 9390180 
2.4.0 :026 > "emerson".object_id
 => 9376900 
2.4.0 :027 > "emerson".object_id
 => 9304580 
2.4.0 :028 > "emerson".class
 => String 
2.4.0 :029 > :abc.object_id # para simbolos é armazana sempre o mesmo valor de memoria
 => 1170588                 # mais usados para criar hashs 
2.4.0 :030 > :abc.class
 => Symbol 
2.4.0 :031 > :abc.object_id
 => 1170588 
2.4.0 :032 > :abc.object_id
 => 1170588 
2.4.0 :033 > "cba".to_sym # pode transformar string em simbolo (simbolo estatico, economiza memoria)
 => :cba 
2.4.0 :034 > :cba.class
 => Symbol 
2.4.0 :035 > 
