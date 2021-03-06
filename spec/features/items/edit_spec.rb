require 'rails_helper'

RSpec.describe 'Item Update' do
  before(:each) do
    @item = create(:item)
    @item2 = create(:item, name: 'bad product', status: 'inactive')
  end

  describe 'When I visit an Item Show page' do
    it "I can modify an item's data" do

      visit "/items/#{@item.id}"

      click_link 'Update Item'

      expect(current_path).to eq("/items/#{@item.id}/edit")
      expect(page).to have_content('Name')
      expect(find_field('item[name]').value).to eq(@item.name)
      expect(page).to have_content('Price')
      expect(find_field('item[price]').value).to eq(@item.price.to_s)
      expect(page).to have_content('Description')
      expect(find_field('item[description]').value).to eq(@item.description)
      expect(page).to have_content('Image')
      expect(find_field('item[image]').value).to eq(@item.image)
      expect(page).to have_content('Inventory')
      expect(find_field('item[inventory]').value).to eq(@item.inventory.to_s)

      fill_in 'item[description]', with: 'new description'
      fill_in 'item[price]', with: 9.98
      fill_in 'item[inventory]', with: 900
      click_on 'Update'

      expect(current_path).to eq("/items/#{@item.id}")
      expect(page).to have_content('new description')
      expect(page).to have_content('9.98')
      expect(page).to have_content('900')
      expect(page).to_not have_content('100')
      expect(page).to_not have_content('99.99')
      expect(page).to_not have_content('Very useful for doing the thing you want')
    end

    context "I can change an item status" do
      it 'Clicking on deactivate' do
        visit "/items/#{@item.id}"
        expect(page).to have_content('active')

        click_on 'Deactivate'

        expect(current_path).to eq("/items/#{@item.id}")
        expect(page).to have_content('inactive')
      end

      it 'Clicking on activate' do
        visit "/items/#{@item2.id}"
        expect(page).to have_content('inactive')

        click_on 'Activate'

        expect(current_path).to eq("/items/#{@item2.id}")
        expect(page).to have_content('active')
      end
    end
  end
end
