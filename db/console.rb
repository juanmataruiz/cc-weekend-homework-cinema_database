require_relative( '../models/customer' )
require_relative( '../models/film' )
require_relative( '../models/ticket' )

require( 'pry' )

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()


customer1 = Customer.new({ 'name' => 'Hannah Green', 'funds' => '20'})
customer1.save()
customer2 = Customer.new({ 'name' => 'Davina Rose', 'funds' => '15'})
customer2.save()
customer3 = Customer.new({ 'name' => 'Carl Smith', 'funds' => '30'})
customer3.save()



film1 = Film.new({ 'title' => 'Frozen', 'price' => '12'})
film1.save()
film2 = Film.new({ 'title' => 'Brave', 'price' => '12'})
film2.save()
film3 = Film.new({ 'title' => 'Salt', 'price' => '12'})
film3.save()


ticket1 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()
ticket2 = Ticket.new({ 'customer_id' => customer2.id, 'film_id' => film1.id})
ticket2.save()
ticket3 = Ticket.new({ 'customer_id' => customer3.id, 'film_id' => film2.id})
ticket3.save()
ticket4 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film3.id})
ticket4.save()




binding.pry
nil
