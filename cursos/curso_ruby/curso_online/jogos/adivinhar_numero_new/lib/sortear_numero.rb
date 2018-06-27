class SortearNumero
    def self.sortear
        v = []
        # Random.rand(10) # posso fazer randomico
        File.open(File.expand_path('../../numeros.txt', __FILE__), 'r') do |arq|  # ou carregar arquivo para pegar um numero dentro do arquivo 
            while line = arq.gets
                v.push (line.to_i)
            end
        end
        v.sample
    end
end