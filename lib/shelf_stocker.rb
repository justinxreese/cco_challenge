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
    # Stock the most visible shelf first
    @shelves.sort_by{|x| -1*x['visibility']}.each do |shelf|
      capacity = shelf['capacity']

      # with the most valuable item
      @stock.sort_by!{|x| -1*x['value']}.delete_if do |item|
        # as long as it fits
        if item['size'] <= capacity
          capacity -= item['size']
          puts item['name']
          true
        else
          # If it doesn't fit, keep it as stock
          false
        end
      end

      puts '^== '+shelf['row']+' ==^ ('+capacity.to_s+'/'+shelf['capacity'].to_s+')'

    end

    puts @stock.size.to_s+" left over items"
  end

end
