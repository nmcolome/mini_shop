require 'rails_helper'

RSpec.describe 'Merchants show page' do
  it "shows a specific merchant's information" do
    merchant = create(:merchant)
    merchant2 = create(:merchant, name: 'Small Store')

    visit "/merchants/#{merchant.id}"

    expect(page).to have_content(merchant.name)
    expect(page).to have_content(merchant.address)
    expect(page).to have_content(merchant.city)
    expect(page).to have_content(merchant.state)
    expect(page).to have_content(merchant.zip)
  end
end

# As a visitor
# When I visit '/merchants/:id'
# Then I see the merchant with that id including the merchant's:
# - name
# - address
# - city
# - state
# - zip
