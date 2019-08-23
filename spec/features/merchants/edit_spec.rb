require 'rails_helper'

RSpec.describe 'Merchant update' do
  describe 'When I visit a merchant show page' do
    it "I can update it's information" do
      merchant = Merchant.create!(name: 'Big Store', address: 'address', city: 'denver', state: 'CO', zip:'11111')

      visit "/merchants/#{merchant.id}"

      click_on 'Update Merchant'

      expect(current_path).to eq("/merchants/#{merchant.id}"/edit)
      expect(find_field('merchant[name]').value).to eq(merchant.name)
      expect(find_field('merchant[address]').value).to eq(merchant.address)
      expect(find_field('merchant[city]').value).to eq(merchant.city)
      expect(find_field('merchant[state]').value).to eq(merchant.state)
      expect(find_field('merchant[zip]').value).to eq(merchant.zip)

      fill_in 'merchant[city]', with: 'Boulder'
      fill_in 'merchant[zip]', with: '12345'
      click_on 'Update'

      expect(current_path).to eq("/merchants/#{merchant.id}")
    end
  end
end

# As a visitor
# When I visit a merchant show page
# Then I see a link to update the merchant
# When I click the link
# Then I am taken to '/merchants/:id/edit' where I  see a form to edit the merchant's data including:
# - name
# - address
# - city
# - state
# - zip
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/merchants/:id',
# the merchant's info is updated,
# and I am redirected to the Merchant's Show page where I see the merchant's updated info