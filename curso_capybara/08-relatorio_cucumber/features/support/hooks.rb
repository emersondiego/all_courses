After do |scenario|
  scenario_name = scenario.name.gsub(/\s+/,'_').tr('/','_') # tira os espaços utulizando gsub

  if scenario.failed?
    tirar_foto(scenario_name.downcase!, 'falhou') # colocando o nome do cenario em letra minuscula
  else
    tirar_foto(scenario_name.downcase!, 'passou')
  end
end