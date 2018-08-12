Quando("acesso a url de botoes") do
  visit '/buscaelementos/botoes'
end

Entao("verifico se encontrei os elementos") do
  page.all(:css, '.btn')
  find('#teste')
  find_by_id('teste')
  find_button(class: 'btn waves-light')
  first('.btn')
  find_link(href: 'https://www.youtube.com/channel/UCp554v_is_ZzjzSmAQyFfAA')
end