Dir[File.join(File.dirname(__FILE__), '../pages/*_page.rb')].each { |file| require file}

module PageObjects
  def mapeando
    @mapeando ||= MapeandoElementoPage.new
  end
end