class Inicializacao
    def self.inicializando
        system('clear') # comandos do ruby / podendo ser qq comando feito no shell - criar pasta/ arquivo 

        File.open(File.expand_path('../../ascii/bat.txt', __FILE__), 'r') do |arq| 
            while line = arq.gets
               puts line
            end
        end

        print "Inicializando."
        4.times do |i|
            sleep 1
            print "."
        end
        puts "."   
        system('clear') # comandos do ruby 
    end
end

