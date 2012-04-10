require 'json'

class ShelfStocker

  def initialize()
    @products = JSON.parse(File.read('dat/products.json'))['products']
    @shelves = JSON.parse(File.read('dat/shelves.json'))['shelves']

    # The stock is the list of products, accounting for quantity on hand
    @stock = []
    @products.each do |product|
      product['qty'].times do
        product['qty'] = 1
        @stock << product
      end
    end

    self
  end

  def fill_shelves
    @shelves.sort_by{|x| -1*x["visibility"]}.each do |shelf|
      puts shelf['row']
      @stock.sort_by!{|x| -1*x['value']}.delete_if do |product|
        puts product['name']
        true
      end
    end
  end

end
