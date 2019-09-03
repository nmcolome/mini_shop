require 'rails_helper'

RSpec.describe 'Items index page' do
  before(:each) do
    @merchant = create(:merchant)
    @item1 = create(:item, merchant_id: @merchant.id)
    @item2 = create(:item, name: 'good product', status: 'inactive', merchant_id: @merchant.id)
    @item2 = create(:item, name: 'so-so product', merchant_id: @merchant.id)
    @item3 = create(:item, name: 'other product')
  end

  describe "When I visit '/items'" do
    it 'I see a list of items with their information' do
      visit '/items'

      expect(page).to have_content('a product')
      expect(page).to have_content('good product')
      expect(page).to have_content('other product')
      expect(page).to have_content('Very useful for doing the thing you want')
      expect(page).to have_content(99.99)
      expect(page).to have_css("img[src*='https://placehold.it/300x300.jpg']")
      expect(page).to have_content('active')
      expect(page).to have_content('inactive')
      expect(page).to have_content(100)
      expect(page).to have_content(@merchant.name)
    end
  end

  describe "When I visit '/merchants/:merchant_id/items'" do
    it "I see a list of items that belong to the Merchant and their information" do
      visit "/merchants/#{@merchant.id}/items"

      expect(page).to have_content('a product')
      expect(page).to have_content('good product')
      expect(page).to have_content('so-so product')
      expect(page).to have_content(99.99)
      expect(page).to have_css("img[src*='https://placehold.it/300x300.jpg']")
      expect(page).to have_content('active')
      expect(page).to have_content('inactive')
      expect(page).to have_content(100)
      expect(page).to_not have_content('other product')
    end

    it 'I can access it through the Merchant show page' do
      visit "/merchants/#{@merchant.id}"

      click_on 'Merchant Items'

      expect(current_path).to eq("/merchants/#{@merchant.id}/items")
    end

    context "I can filter based on an items' status" do
      it 'Filters active items' do
        visit "/merchants/#{@merchant.id}/items"
  
        click_on 'Show only active items'
  
        expect(page).to have_current_path("/merchants/#{@merchant.id}/items?active=true")
  
        expect(page).to have_content('a product')
        expect(page).to have_content('so-so product')
        expect(page).to_not have_content('good product')
      end

      it 'Filter inactive items' do
        visit "/merchants/#{@merchant.id}/items"

        click_on 'Show only inactive items'
  
        expect(page).to have_current_path("/merchants/#{@merchant.id}/items?active=false")
  
        expect(page).to have_content('good product')
        expect(page).to_not have_content('a product')
        expect(page).to_not have_content('so-so product')
      end

      it 'Remove filters' do
        visit "/merchants/#{@merchant.id}/items"

        click_on 'Show all'
  
        expect(page).to have_current_path("/merchants/#{@merchant.id}/items")
  
        expect(page).to have_content('good product')
        expect(page).to have_content('a product')
        expect(page).to have_content('so-so product')
      end
    end
  end
end
