Quando("clico no botao") do
  @ajax = AjaxPage.new
  @ajax.load
  @ajax.clicar_botao
end

Quando("verifico se apareceu") do
  @ajax.wait_for_mensagem
  expect(@ajax.mensagem.text).to eq ('Você Clicou no Botão!')
end