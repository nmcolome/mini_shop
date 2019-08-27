require 'rails_helper'

RSpec.describe 'Item Delete' do
  describe 'In the item show page' do
    it 'I can delete the item' do
      item = create(:item)

      visit "/items/#{item.id}"

      click_link 'Delete Item'

      expect(current_path).to eq('/items')
      expect(page).to_not have_content(item.name)
    end
  end
end

# As a visitor
# When I visit an item show page
# Then I see a link to delete the item
# When I click the link
# Then a 'DELETE' request is sent to '/items/:id',
# the item is deleted,
# and I am redirected to the item index page where I no longer see this item
