require 'rails_helper'

RSpec.describe 'Item Update' do
  describe 'When I visit an Item Show page' do
    it "I can modify an item's data" do
      item = create(:item)

      visit "/items/#{item.id}"

      click_link 'Update Item'

      expect(current_path).to eq("/items/#{item.id}/edit")
      expect(page).to have_content('Name')
      expect(find_field('item[name]').value).to eq(item.name)
      expect(page).to have_content('Price')
      expect(find_field('item[price]').value).to eq(item.price.to_s)
      expect(page).to have_content('Description')
      expect(find_field('item[description]').value).to eq(item.description)
      expect(page).to have_content('Image')
      expect(find_field('item[image]').value).to eq(item.image)
      expect(page).to have_content('Inventory')
      expect(find_field('item[inventory]').value).to eq(item.inventory.to_s)
      expect(page).to have_content('Status')
      expect(find_field('item[status]').value).to eq('active')

      fill_in 'item[description]', with: 'new description'
      fill_in 'item[price]', with: 9.98
      fill_in 'item[inventory]', with: 900
      select 'inactive', from: 'item[status]'
      click_on 'Update'

      expect(current_path).to eq("/items/#{item.id}")
      expect(page).to have_content('new description')
      expect(page).to have_content('9.98')
      expect(page).to have_content('900')
      expect(page).to have_content('inactive')
      expect(page).to_not have_content('100')
      expect(page).to_not have_content('99.99')
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
