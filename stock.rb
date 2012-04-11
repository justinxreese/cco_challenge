require './lib/shelf_stocker.rb'

begin
  products = File.new('dat/products.json') 
  shelves = File.new('dat/shelves.json')
rescue Exception => e
  puts e
  exit
end

stocker = ShelfStocker.new(products,shelves)
stocker.fill_shelves

# So that's what things would be like if I'd invented the fing-longer
