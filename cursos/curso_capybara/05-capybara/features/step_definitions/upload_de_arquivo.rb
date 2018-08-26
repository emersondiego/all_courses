Quando("eu faco um upload de arquivo") do
  visit '/outros/uploaddearquivos'
  # modo 1
  # attach_file('upload', '<incluir caminho da maquina>/features/download.png', make_visible: true)
  
  # modo 2 
  @image = File.join(Dir.pwd, 'features/download.png')
  attach_file('upload', @image, make_visible: true)
end