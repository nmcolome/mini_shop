require 'rails_helper'

RSpec.describe 'New Merchant' do
  describe 'When I visit the Merchants Index' do
    it 'can create a new merchant' do
      visit '/merchants'

      click_on 'New Merchant'

      expect(current_path).to eq('/merchants/new')

      fill_in 'Name', with: 'The Market'
      fill_in 'Address', with: '1234 16th St'
      fill_in 'City', with: 'Los Angeles'
      fill_in 'State', with: 'CA'
      fill_in 'Zip', with: '01010'
      click_on 'Create'

      expect(current_path).to eq('/merchants')
      expect(page).to have_content('The Market')
    end
  end
end

# As a visitor
# When I visit the Merchant Index page
# Then I see a link to create a new merchant
# When I click this link
# Then I am taken to '/merchants/new' where I  see a form for a new merchant
# When I fill out the form with a new merchant's:
# - name
# - address
# - city
# - state
# - zip
# And I click the button to submit the form
# Then a `POST` request is sent to '/merchants',
# a new merchant is created,
# and I am redirected to the Merchant Index page where I see the new Merchant listed.
