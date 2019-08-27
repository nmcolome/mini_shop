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
