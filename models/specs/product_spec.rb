require('minitest/autorun')
require('minitest/rg')
require_relative('../product.rb')

class TestProduct < Minitest::Test

  def setup
    options = {"id" => 1, "name" => "DC Spirit Snowboard",
      "description" => "The fastest and boldest", "quantity" => "1", "cost" => "175",
      "sell_price" => "2000"}

      @product = Product.new(options)

  end

  def test_name()
    result = @product.name()
    assert_equal("DC Spirit Snowboard", result)
  end

  def test_cost()
    result = @product.cost()
    assert_equal(175, result)
  end

  def test_quantity()
    result = @product.quantity()
    assert_equal(1, result)
  end

  def test_mark_up()
    result = @product.mark_up()
    assert_equal(1825, result)
  end

  def test_stock_level()
    result = @product.stock_level()
    assert_equal("Low Stock", result)
  end

end
