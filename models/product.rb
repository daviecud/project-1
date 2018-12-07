require_relative('../db/sql_runner.rb')
require_relative('./manufacturer.rb')

class Product

  attr_accessor :name, :description, :quantity, :cost, :sell_price
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @description = options['description']
    @quantity = options['quantity'].to_i
    @cost = options['cost'].to_i
    @sell_price = options['sell_price'].to_i
    @manufacturer_id = options['manufacturer_id'].to_i
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO products (
      name,
      description,
      quantity,
      cost,
      sell_price,
      manufacturer_id,
      size,
      sport_type
    ) VALUES (
      $1, $2, $3, $4, $5, $6, $7, $8
    ) RETURNING *"
    values = [@name, @description, @quantity, @cost, @sell_price, @manufacturer_id,
              @size, @sport_type]
    product_data = SqlRunner.run(sql, values)
    @id = product_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE products SET (
      name,
      description,
      quantity,
      cost,
      sell_price,
      manufacturer_id,
      size,
      sport_type
    ) = (
      $1, $2, $3, $4, $5, $6, $7, $8
      ) WHERE id = $9"
      values = [@name, @description, @quantity, @cost, @sell_price, @manufacturer_id,
                @size, @sport_type, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM products WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM products"
    product = SqlRunner.run(sql)
    result = products.map { |product| Product.new(product)}
    return result
  end

  def self.find()
    sql = "SELECT * FROM products WHERE id = $1"
    values = [id]
    product = SqlRunner.run(sql, values)
    result = Product.new(product.first)
    return result
  end

end
