require_relative('../db/sql_runner.rb')
require_relative('./product.rb')

class Manufacturer

attr_accessor :name, :phone, :country
attr_reader :id

def initialize(options)
  @id = options ['id'].to_i if options ['id']
  @name = options['name']
  @phone = options['phone']
  @country = options['country']
end

def save()
  sql = "INSERT INTO manufacturers (
    name,
    phone,
    country

  ) VALUES (
    $1, $2, $3
  )
  RETURNING *"
  values = [@name, @phone, @country]
  manufacturer_data = SqlRunner.run(sql, values)
  @id = manufacturer_data[0]["id"]
end

def update()
  sql = "UPDATE manufacturers SET (
    name,
    phone,
    country
  ) VALUES (
    $1, $2, S3
    ) WHERE id = $4"
    values = [@name, @phone, @country, @id]
    SqlRunner.run(sql, values)
end

def delete()
  sql = "DELETE FROM manufacturers WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.delete_all()
  sql = "DELETE FROM manufacturers"
  SqlRunner.run(sql)
end

def self.find(id)
  sql = "SELECT FROM manufacturers WHERE id = $1"
  values = [id]
  manufacturer = SqlRunner.run(sql, values)[0]
  return Manufacturer.new(manufacturer)
end

def self.all()
  sql = "SELECT * FROM manufacturers"
  manufacturer = SqlRunner.run(sql)
  result = manufacturer.map { |manufacturer| Manufacturer.new(manufacturer)}
  return result
end

def products()
  sql = "SELECT * FROM products WHERE id = $1"
  values = [@id]
  products = SqlRunner.run(sql, values)
  return products.map {|product| Product.new(product)}
end

end
