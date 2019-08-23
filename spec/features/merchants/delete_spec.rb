require 'rails_helper'

RSpec.describe 'Merchant delete' do
  describe 'When I visit a merchant show page' do
    it 'I can delete the merchant' do
      merchant = Merchant.create!(name: 'Big Store', address: 'address', city: 'denver', state: 'CO', zip:'11111')
      merchant2 = Merchant.create!(name: 'Small Store')

      visit "merchants/#{@merchant.id}"

      click_on 'Delete Merchant'

      expect(current_path).to eq('/merchants')
      expect(page).to_not have_content(merchant.name)
      expect(page).to have_content(merchant2.name)
    end
  end
end

# As a visitor
# When I visit a merchant show page
# Then I see a link to delete the merchant
# When I click the link
# Then a 'DELETE' request is sent to '/merchants/:id',
# the merchant is deleted,
# and I am redirected to the merchant index page where I no longer see this merchant
