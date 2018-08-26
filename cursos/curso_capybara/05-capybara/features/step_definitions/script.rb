Quando("eu uso script") do
  visit '/outros/scroll'
  page.execute_script("window.scrollBy(0,1500)")

  @result = page.evaluate_script('4 + 4');
  puts "O resultado do JQuery é #{@result}"
end