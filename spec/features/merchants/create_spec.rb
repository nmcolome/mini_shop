require 'rails_helper'

RSpec.describe 'New Merchant' do
  describe 'When I visit the Merchants Index' do
    it 'can create a new merchant' do
      visit '/merchants'

      click_on 'New Merchant'

      expect(current_path).to eq('/merchants/new')

      fill_in 'merchant[name]', with: 'The Market'
      fill_in 'merchant[address]', with: '1234 16th St'
      fill_in 'merchant[city]', with: 'Los Angeles'
      fill_in 'merchant[state]', with: 'CA'
      fill_in 'merchant[zip]', with: '01010'
      click_on 'Create'

      expect(current_path).to eq('/merchants')
      expect(page).to have_content('The Market')
    end
  end
end
