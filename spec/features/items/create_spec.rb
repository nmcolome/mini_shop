require 'rails_helper'

RSpec.describe 'Item creation' do
  describe 'When I visit a Merchant Items Index page' do
    it 'I can create a new item' do
      merchant = create(:merchant)
      attributes = attributes_for(:item)

      visit "/merchants/#{merchant.id}/items"

      click_link 'New Item'

      expect(current_path).to eq("/merchants/#{merchant.id}/items/new")

      fill_in 'item[name]', with: attributes[:name]
      fill_in 'item[price]', with: attributes[:price]
      fill_in 'item[description]', with: attributes[:description]
      fill_in 'item[image]', with: attributes[:image]
      fill_in 'item[inventory]', with: attributes[:inventory]
      click_on 'Create'

      expect(current_path).to eq("/merchants/#{merchant.id}/items")
      expect(page).to have_content('active')
      expect(page).to have_content(attributes[:name])
      expect(page).to have_content(attributes[:description])
      expect(page).to have_content(attributes[:inventory])
      expect(page).to have_css("img[src*='#{attributes[:image]}']")
    end
  end
end

# As a visitor
# When I visit a Merchant Items Index page
# Then I see a link to add a new item for that merchant
# When I click the link
# I am taken to '/merchants/:merchant_id/items/new' where I see a form to add a new item
# When I fill in the form with the item's:
# - name
# - price
# - description
# - image
# - inventory
# Then a `POST` request is sent to '/merchants/:merchant_id/items',
# a new item is created for that merchant,
# that item has a status of 'active',
# and I am redirected to the Merchant Items Index page where I see the new item
