require 'rails_helper'

RSpec.describe 'Merchant index page' do
  it "shows a list of all merchant's names" do
    merchant = Merchant.new(name: 'Big Store')
    merchant2 = Merchant.new(name: 'Small Store')

    visit '/merchants'

    expect(page).to have_content(merchant.name)
    expect(page).to have_content(merchant2.name)
  end
end

# As a visitor
# When I visit '/merchants'
# Then I see the name of each merchant in the system
