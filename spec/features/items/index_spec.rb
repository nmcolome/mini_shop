require 'rails_helper'

RSpec.describe 'Items index page' do
  it 'shows a list of items with their information' do
    item1 = create(:item)
    item2 = create(:item, name: 'good product', status: 'inactive')

    visit '/items'

    expect(page).to have_content('a product')
    expect(page).to have_content('good product')
    expect(page).to have_content('Very useful for doing the thing you want')
    expect(page).to have_content(99.99)
    expect(page).to have_css("img[src*='https://placehold.it/300x300.jpg']")
    expect(page).to have_content('active')
    expect(page).to have_content('inactive')
    expect(page).to have_content(100)
    expect(page).to have_content(item1.merchant.name)
  end
end
