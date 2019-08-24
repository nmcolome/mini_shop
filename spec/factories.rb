FactoryBot.define do
  factory :merchant do
    name { 'The Market' }
    address { '123 X st.' }
    city { 'Denver' }
    state { 'CO' }
    zip { '01010' }
  end
end
