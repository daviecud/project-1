require_relative('../db/sql_runner.rb')
require_relative('./manufacturer.rb')

class Product

  attr_accessor :name, :description, :quantity, :cost, :sell_price,
                :size, :sport_type, :manufacturer
  attr_reader   :id

  def initialize(options)
    @name = options['name']
    @description = options['description']
    @quantity = options['quantity'].to_i
    @cost = options['cost'].to_i
    @sell_price = options['sell_price'].to_i
    @size = options['size'].to_i
    @sport_type = options['sport_type']
    @manufacturer = options['manufacturer']
    # @manu_id = options['manu_id'].to_i()
    @id = options['id'].to_i if options['id']
  end

  def product_name()
    return "#{@name}"
  end

  def save()
    sql = "INSERT INTO products (
      name,
      description,
      quantity,
      cost,
      sell_price,
      size,
      sport_type,
      manufacturer
    ) VALUES (
      $1, $2, $3, $4, $5, $6, $7, $8
    )
    RETURNING *"
    values = [@name, @description, @quantity, @cost, @sell_price,
              @size, @sport_type, @manufacturer]
    product_data = SqlRunner.run(sql, values)
    @id = product_data[0]['id']
  end

  def update()
    sql = "UPDATE products SET (
      name,
      description,
      quantity,
      cost,
      sell_price,
      size,
      sport_type,
      manufacturer
    ) = (
      $1, $2, $3, $4, $5, $6, $7, $8
      ) WHERE id = $9"
      values = [@name, @description, @quantity, @cost, @sell_price,
                @size, @sport_type, @manufacturer,  @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM products WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM products"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM products"
    product = SqlRunner.run(sql)
    result = product.map { |product| Product.new(product)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM products WHERE id = $1"
    values = [id]
    product = SqlRunner.run(sql, values)[0]
    return Product.new(product)

  end

  def manufacturers()
    sql = "SELECT * FROM manufacturers WHERE id = $1"
    values = [@id]
    manufacturers = SqlRunner.run(sql, values)[0]
    return Manufacturer.new(manufacturers)
  end

  def mark_up()
    markup = (@sell_price - @cost)
    return markup
  end

  def stock_level()
    level = @quantity
    if level == 1
      return "Low Stock"
    elsif level == 0
      return "Out of Stock"
    end
  end

end
