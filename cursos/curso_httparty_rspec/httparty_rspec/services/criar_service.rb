module Criar
  include HTTParty
  # base_uri 'https://api-de-tarefas.herokuapp.com'
  base_uri CONFIG['url_padrao']
  format :json
end