Quando("acesso a url") do
  visit '/treinamento/home'
  sleep 5
end

Entao("verifico se estou na pagina correta") do
  expect(page).to have_current_path('https://automacaocombatista.herokuapp.com/treinamento/home', url: true)
end