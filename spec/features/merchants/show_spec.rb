require 'rails_helper'

RSpec.describe 'Merchants show page' do
  before(:each) do
    @merchant = create(:merchant)
    @merchant2 = create(:merchant, name: 'Small Store')
    @item = create(:item, merchant_id: @merchant.id)
  end
  it "shows a specific merchant's information" do
    visit "/merchants/#{@merchant.id}"

    expect(page).to have_content(@merchant.name)
    expect(page).to have_content(@merchant.address)
    expect(page).to have_content(@merchant.city)
    expect(page).to have_content(@merchant.state)
    expect(page).to have_content(@merchant.zip)
  end

  describe "I visit the merchants index page" do
    it "When I click on a merchant's name in the merchants index page" do
      visit '/merchants'

      click_on @merchant.name

      expect(current_path).to eq "/merchants/#{@merchant.id}"
      expect(page).to have_content(@merchant.address)
    end


    it "When I click on a merchant's name in the items index page" do
      visit '/items'

      click_on @merchant.name

      expect(current_path).to eq("/merchants/#{@merchant.id}")
      expect(page).to have_content(@merchant.address)
    end

    it "When I click on a merchant's name in the items show page" do
      visit "/items/#{@item.id}"

      click_on @merchant.name

      expect(current_path).to eq("/merchants/#{@merchant.id}")
      expect(page).to have_content(@merchant.address)
    end
  end
end
