require 'rails_helper'

RSpec.describe 'New Merchant' do
  describe 'When I visit the Merchants Index' do
    it 'can create a new merchant' do
      attrs = attributes_for(:merchant)

      visit '/merchants'

      click_on 'New Merchant'

      expect(current_path).to eq('/merchants/new')

      fill_in 'merchant[name]', with: attrs[:name]
      fill_in 'merchant[address]', with: attrs[:address]
      fill_in 'merchant[city]', with: attrs[:city]
      fill_in 'merchant[state]', with: attrs[:state]
      fill_in 'merchant[zip]', with: attrs[:zip]
      click_on 'Create'

      expect(current_path).to eq('/merchants')
      expect(page).to have_content('The Market')
    end
  end
end
