require 'rails_helper'

RSpec.describe 'Merchant update' do
  describe 'When I visit a merchant show page' do
    it "I can update it's information" do
      merchant = create(:merchant)

      visit "/merchants/#{merchant.id}"

      click_on 'Update Merchant'

      expect(current_path).to eq("/merchants/#{merchant.id}/edit")
      expect(find_field('merchant[name]').value).to eq(merchant.name)
      expect(find_field('merchant[address]').value).to eq(merchant.address)
      expect(find_field('merchant[city]').value).to eq(merchant.city)
      expect(find_field('merchant[state]').value).to eq(merchant.state)
      expect(find_field('merchant[zip]').value).to eq(merchant.zip)

      fill_in 'merchant[city]', with: 'Boulder'
      fill_in 'merchant[zip]', with: '12345'
      click_on 'Update'

      expect(current_path).to eq("/merchants/#{merchant.id}")
      expect(page).to have_content('Boulder')
      expect(page).to have_content('12345')
    end
  end
end
