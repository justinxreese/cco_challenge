require 'json'

class ShelfStocker

  def initialize()
    @products = JSON.parse File.read('dat/products.json')
    @shelves = JSON.parse File.read('dat/shelves.json')
    self
  end

end
