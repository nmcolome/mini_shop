require 'rails_helper'

RSpec.describe 'Item Update' do
  describe 'When I visit an Item Show page' do
    it "I can modify an item's data" do
      item = create(:item)

      visit "/items/#{item.id}"

      click_link 'Update Item'

      expect(current_path).to eq("/items/#{item.id}/edit")
      expect(page).to have_content('Name')
      expect(page).to have_content(item.name)
      expect(page).to have_content('Price')
      expect(page).to have_content(item.price)
      expect(page).to have_content('Description')
      expect(page).to have_content(item.description)
      expect(page).to have_content('Image')
      expect(page).to have_content(item.image)
      expect(page).to have_content('Inventory')
      expect(page).to have_content(item.inventory)

      fill_in 'item[description]', with: 'new description'
      fill_in 'item[price]', with: 9.98
      fill_in 'item[inventory]', with: 900
      click_on 'Update'

      expect(current_paht).to eq("/items/#{item.id}")
      expect(page).to have_content('new description')
      expect(page).to have_content(9.99)
      expect(page).to have_content(900)
      expect(page).to_not have_content(100)
      expect(page).to_not have_content(99.99)
      expect(page).to_not have_content('Very useful for doing the thing you want')
    end
  end
end

# As a visitor
# When I visit an Item Show page
# Then I see a link to update that Item
# When I click the link
# I am taken to '/items/:id/edit' where I see a form to edit the item's data including:
# - name
# - price
# - description
# - image
# - inventory
# When I click the button to submit the form
# Then a `PATCH` request is sent to '/items/:id',
# the item's data is updated,
# and I am redirected to the Item Show page where I see the Item's updated information
