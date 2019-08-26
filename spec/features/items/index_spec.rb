require 'rails_helper'

RSpec.describe 'Items index page' do
  it 'shows a list of items with their information' do
    item1 = create(:item)
    item2 = create(:item, name: 'good product', status: 'inactive')

    visit '/items'

    expect(page).to have_content('a product')
    expect(page).to have_content('good product')
    expect(page).to have_content('Very useful for doing the thing you want')
    expect(page).to have_content(item2.description)
    expect(page).to have_content(99.99)
    expect(page).to have_content(item2.price)
    expect(page).to have_content(item1.image)
    expect(page).to have_content(item2.image)
    expect(page).to have_content('active')
    expect(page).to have_content('inactive')
    expect(page).to have_content(100)
    expect(page).to have_content(item2.inventory)
    expect(page).to have_content(item1.merchant.name)
  end
end

# As a visitor
# When I visit '/items'
# Then I see each Item in the system including the Item's:
# - name
# - description
# - price
# - image
# - active/inactive status
# - inventory
# - the name of the merchant that sells the item
