Quando("preencho os campos") do
  @pagina_iframe = PaginaPadrao.new
  @pagina_iframe.load

  @pagina_iframe.preencher_campos do |iframe|
    iframe.nome.set 'Emerson'
    iframe.sobrenome.set 'Pereira'
  end
end