require 'rails_helper'

RSpec.describe 'Merchant index page' do
  it "shows a list of all merchant's names" do
    merchant = create(:merchant)
    merchant2 = create(:merchant, name: 'Small Store')

    visit '/merchants'

    expect(page).to have_content(merchant.name)
    expect(page).to have_content(merchant2.name)
  end
end
