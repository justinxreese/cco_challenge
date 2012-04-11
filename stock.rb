require './lib/shelf_stocker.rb'

if ARGV.empty?
  products_path = 'dat/products.json'
  shelves_path = 'dat/shelves.json'
else
  products_path = ARGV[0]
  shelves_path = ARGV[1]
end

begin
  products = File.new products_path
  shelves = File.new shelves_path
rescue Exception => e
  puts e
  exit
end

stocker = ShelfStocker.new(products,shelves)
stocker.fill_shelves

# So that's what things would be like if I'd invented the fing-longer
