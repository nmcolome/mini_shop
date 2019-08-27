require 'rails_helper'

RSpec.describe 'Item show page' do
  before(:each) do
    @item = create(:item)
  end

  it "I see the item with it's information" do

    visit "/items/#{@item.id}"

    expect(page).to have_content(@item.name)
    expect(page).to have_content(@item.status)
    expect(page).to have_content(@item.price)
    expect(page).to have_content(@item.description)
    expect(page).to have_content(@item.image)
    expect(page).to have_content(@item.inventory)
    expect(page).to have_content(@item.merchant.name)
  end

  describe 'Item show page links' do
    it "When I click on an item's name in the merchant items index page" do
      visit "/merchants/#{@item.merchant_id}/items"

      click_on @item.name

      expect(current_path).to eq("/items/#{@item.id}")
    end

    it "When I click on an item's name in the items index page" do
      visit '/items'

      click_on @item.name

      expect(current_path).to eq("/items/#{@item.id}")
    end
  end
end
