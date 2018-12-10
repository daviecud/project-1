require('minitest/autorun')
require('minitest/rg')
require_relative('../product.rb')

class TestManufacturer < Minitest::Test

  def setup
    options = {"id" => 1, "name" => "Kangaroo Poo",
      "phone" => "12345678", "country" => "SwazzyLand"}

      @manufacturer = Manufacturer.new(options)

  end

  def test_name()
    result = @manufacturer.name()
    assert_equal("Kangaroo Poo", result)
  end

  def test_phone()
    result = @manufacturer.phone()
    assert_equal("12345678", result)
  end

  def test_country()
    result = @manufacturer.country()
    assert_equal("SwazzyLand", result)
  end


end
