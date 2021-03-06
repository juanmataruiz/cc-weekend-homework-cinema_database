require_relative("../db/sql_runner")
require_relative("ticket")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @funds = options["funds"].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run( sql, values ).first
    @id = customer["id"].to_i
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON tickets.film_id = films.id WHERE tickets.customer_id = $1"
    values = [@id]
    film_hashes = SqlRunner.run(sql, values)
    films = film_hashes.map { |film| Film.new(film)}
    return films
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    results = SqlRunner.run(sql, values)
  end

  def buy_ticket(film)
    if film.price <= @funds
      @funds -= film.price
      self.update()
      new_ticket = Ticket.new({'customer_id' => @id , 'film_id' => film.id})
      new_ticket.save()
    end
  end

  def tickets()
    sql = "SELECT tickets.* FROM tickets WHERE tickets.customer_id = $1"
    values = [@id]
    tickets = SqlRunner.run(sql, values)
    return tickets.count
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customer_hashes = SqlRunner.run(sql)
    return self.map_items(customer_hashes)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.map_items(customer_hashes)
    customers = customer_hashes.map {|customer_hash| Customer.new(customer_hash)}
  end

end
