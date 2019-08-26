require 'rails_helper'

RSpec.describe 'Items index page' do
  it 'shows a list of items with their information' do
    item1 = create(:item)
    item2 = create(:item, name: 'good product', status: 'inactive')
    visit '/items'

    expect(page).to have_content(item1.name)
    expect(page).to have_content(item2.name)
    expect(page).to have_content(item1.description)
    expect(page).to have_content(item2.description)
    expect(page).to have_content(item1.price)
    expect(page).to have_content(item2.price)
    expect(page).to have_content(item1.image)
    expect(page).to have_content(item2.image)
    expect(page).to have_content(item1.status)
    expect(page).to have_content(item2.status)
    expect(page).to have_content(item1.inventory)
    expect(page).to have_content(item2.inventory)
    expect(page).to have_content(merchant.name)
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
