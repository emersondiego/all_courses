Quando("preencho o formulario") do
  @mapeando = MapeandoElementoPage.new
  @mapeando.load
  @mapeando.preencher
end