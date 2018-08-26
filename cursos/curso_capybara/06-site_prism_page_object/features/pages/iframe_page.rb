class PaginaIframe < SitePrism::Page
  element :nome, '#first_name'
  element :sobrenome, '#last_name'
end

class PaginaPadrao < SitePrism::Page
  set_url '/mudancadefoco/iframe'
  iframe :preencher_campos, PaginaIframe, '#id_do_iframe'
end