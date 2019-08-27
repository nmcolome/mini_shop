require 'faker'

20.times do
  merchant = Merchant.create!(
    name: Faker::Company.name,
    address: Faker::Address.street_address + ' ' + Faker::Address.building_number,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip
  )

  5.times do
    merchant.items.create!(
      name: Faker::Food.dish,
      description: Faker::Food.description,
      price: Faker::Commerce.price,
      image: Faker::LoremFlickr.image,
      inventory: rand(1000)
    )
  end
end
