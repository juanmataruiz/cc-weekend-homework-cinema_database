require_relative( '../models/customer' )
require_relative( '../models/film' )
require_relative( '../models/ticket' )

require( 'pry' )


customer1 = Customer.new({ 'name' => 'Hannah Green', 'fund' => '20'})
customer2 = Customer.new({ 'name' => 'Davina Rose', 'fund' => '15'})
customer3 = Customer.new({ 'name' => 'Carl Smith', 'fund' => '30'})


film1 = Film.new({ 'title' => 'Frozen', 'price' => '12'})
film2 = Film.new({ 'title' => 'Brave', 'price' => '12'})
film3 = Film.new({ 'title' => 'Salt', 'price' => '12'})

ticket1 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film1.id})
ticket2 = Ticket.new({ 'customer_id' => customer2.id, 'film_id' => film1.id})
ticket3 = Ticket.new({ 'customer_id' => customer3.id, 'film_id' => film2.id})
ticket4 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film3.id})



binding.pry
nil
