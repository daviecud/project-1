require_relative('../db/sql_runner.rb')
require_relative('./product.rb')

class Maunfacturer

attr_accessor :name, :phone, :address
attr_reader :id

def initialize(options)
  @id = options ['id'].to_i if options ['id']
  @name = options['name']
  @phone = options['phone'].to_i
  @address = options['address']
end

def save()
  sql = "INSERT INTO manufacturers (
    name,
    phone,
    address

  ) VALUES (
    $1, $2, $3
  )
  RETURNING *"
  values = [@name, @phone, @address]
  maufacturer_data = SqlRunner.run(sql, values)
  @id = manufacturer_data.first()['id'].to_i
end

def update()
  sql = "UPDATE manufacturers SET (
    name,
    phone,
    address
  ) VALUES (
    $1, $2, S3
    ) WHERE id = $4"
    values = [@name, @phone, @address, @id]
    SqlRunner.run(sql, values)
end

def delete()
  sql = "DELETE FROM manufacturers WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.find(id)
  sql = "SELECT FROM manufacturers WHERE id = $1"
  values = [id]
  manufacturer = SqlRunner.run(sql, values)
  result = Manufacturer.new(manufacturer)
  return result
end

def self.all()
  sql = "SELECT * FROM manufacturers"
  manufacturer = SqlRunner.run(sql)
  result = manufacturer.map { |manufacturer| Manufacturer.new(manufacturer)}
  return result
end

end
