require 'faker'

class Seed
  def run
    destroy_records
    generate_merchants
    generate_items
  end

  def destroy_records
    Item.destroy_all
    Merchant.destroy_all
  end

  def generate_merchants
    10.times do
      merchant = Merchant.create!(
        name: Faker::Company.name,
        address: Faker::Address.street_address + ' ' + Faker::Address.building_number,
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        zip: Faker::Address.zip
      )
    end
  end

  def generate_items
    Merchant.all.each do |merchant|
      5.times do
        merchant.items.create!(
          name: Faker::Lorem.sentence,
          description: Faker::Lorem.paragraph,
          price: Faker::Commerce.price,
          image: Faker::LoremFlickr.image,
          inventory: rand(1000)
        )
      end
    end
  end
end

Seed.new.run