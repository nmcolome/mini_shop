require 'rails_helper'

RSpec.describe 'Merchant delete' do
  describe 'When I visit a merchant show page' do
    it 'I can delete the merchant' do
      merchant = create(:merchant)
      merchant2 = create(:merchant, name: 'Small Store')

      visit "merchants/#{merchant.id}"

      click_on 'Delete Merchant'

      expect(current_path).to eq('/merchants')
      expect(page).to_not have_content(merchant.name)
      expect(page).to have_content(merchant2.name)
    end
  end
end
