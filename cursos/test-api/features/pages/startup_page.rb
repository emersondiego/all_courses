class Startup
  include HTTParty
  require_relative "../hooks/startup_hook"
  base_uri "http://5b49f9b0ff11b100149bf42b.mockapi.io/cm"

  def initialize(body)
    @options = {:body => body}
    @options2 = {}

  end

  def post_startup
    self.class.post("/startup", @options)
  end

  def get_startup (id)
    self.class.get("/startup/#{id}", @options2)
  end

  def put_startup (id)
    self.class.put("/startup/#{id}", @options)
  end

  def delete_startup (id)
    self.class.delete("/startup/#{id}", @options2)
  end
end