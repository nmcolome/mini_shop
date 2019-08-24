require 'faker'

50.times do
  Merchant.create!(
    name: Faker::Company.name,
    address: Faker::Address.street_address + ' ' + Faker::Address.building_number,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip
  )
end
