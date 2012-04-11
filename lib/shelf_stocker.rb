require 'json'

class ShelfStocker

  def initialize(products,shelves)
    @stock = []
    @shelves = JSON.parse(shelves.read)['shelves']
    products = JSON.parse(products.read)['products']

    # Stock is the list of products, accounting for quantity
    products.each do |product|
      product['qty'].times do
        product['qty'] = 1
        @stock << product
      end
    end

    self
  end

  # Uses instance variables to fill shelves and displays the 
  # resulting shelf configuration as plain text output
  def fill_shelves
    # Stock the most visible shelf first
    @shelves.sort_by{|x| -1*x['visibility']}.each do |shelf|
      capacity = shelf['capacity']
      shelf_items = []

      # with the most valuable item
      @stock.sort_by!{|x| -1*x['value']}.delete_if do |item|
        if item['size'] <= capacity # as long as it fits
          capacity -= item['size']
          shelf_items << item
          true
        else # If it doesn't fit, keep it as stock
          false 
        end
      end

      puts '==== '+shelf['row']+' Shelf, Remaining Capacity: '+capacity.to_s+' ===='
      puts shelf_items.collect{|x| x['name']}.join(',')
    end

    puts @stock.size.to_s+" items not stocked"
  end

end
