require('pry')
require_relative('./models/product.rb')
require_relative('./models/manufacturer.rb')

Product.delete_all()
Manufacturer.delete_all()


product1 = Product.new({
  "name" => "Burton Smokie Snowboard",
  "description" => "The best in Snowboarding.",
  "quantity" => "8",
  "cost" => "180",
  "sell_price" => "250",
  "size" => "180",
  "sport_type" => "Snowboarding",
  "manufacturer" => "Burton"
  })

  product2 = Product.new({
    "name" => "Salomon Xmax Skis",
    "description" => "The ultimate in off-piste skiing reliability",
    "quantity" => "5",
    "cost" => "210",
    "sell_price" => "300",
    "size" => "160",
    "sport_type" => "Skiing",
    "manufacturer" => "Salomon"
    })

    product3 = Product.new({
      "name" => "The North Face Snow Quest Jacket",
      "description" => "For all situations on the slopes.",
      "quantity" => "10",
      "cost" => "200",
      "sell_price" => "320",
      "size" => "42",
      "sport_type" => "Winter Sports",
      "manufacturer" => "The North Face"
      })

    product4 = Product.new({
      "name" => "DC Free Soul Snowboard",
      "description" => "The boldest on the slopes",
      "quantity" => "1",
      "cost" => "175",
      "sell_price" => "2000",
      "size" => "160",
      "sport_type" => "Snowboarding",
      "manufacturer" => "DC"
      })

      product1.save()
      product2.save()
      product3.save()
      product4.save()

      manufacturer1 = Manufacturer.new({
        "name" => "Burton",
        "phone" => "01604 422940",
        "country" => "USA"
      })

      manufacturer2 = Manufacturer.new({
        "name" => "The North Face",
        "phone" => "0800 328 0012",
        "country" => "USA"
      })

      manufacturer3 = Manufacturer.new({
        "name" => "The Salomon Group",
        "phone" => "020 7078 3528",
        "country" => "France"
        })

      manufacturer1.save()
      manufacturer2.save()
      manufacturer3.save()


      binding.pry
      nil
