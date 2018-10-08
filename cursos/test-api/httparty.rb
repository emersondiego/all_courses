require 'httparty'


# =begin GET
response = HTTParty.get('http://5b49f9b0ff11b100149bf42b.mockapi.io/cm/startup')
puts "response code :#{response.code}"
puts "response message :#{response.message}"
puts "response headers:#{response.headers}"
puts "response body:#{response.body}"




=begin POST
response = HTTParty.post('http://5b49f9b0ff11b100149bf42b.mockapi.io/cm/startup',
  :body => {"nome": "moip", "cidade": "São Paulo"})
puts "response code :#{response.code}"
puts "response message :#{response.message}"
puts "response headers:#{response.headers.inspect}"
puts "response body:#{response.body}"
=end

=begin DELETE para conseguir dar o post
http://5b49f9b0ff11b100149bf42b.mockapi.io/cm/startup/2
=end