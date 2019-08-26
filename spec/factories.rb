FactoryBot.define do
  factory :merchant do
    name { 'The Market' }
    address { '123 X st.' }
    city { 'Denver' }
    state { 'CO' }
    zip { '01010' }
  end

  factory :item do
    name { 'a product' }
    description { 'Very useful for doing the thing you want' }
    price { 99.99 }
    # image { }
    inventory { 100 }
    merchant
  end
end
