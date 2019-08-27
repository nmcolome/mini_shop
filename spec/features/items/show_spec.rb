require 'rails_helper'

RSpec.describe 'Item show page' do
  it "I see the item with it's information" do
    item = create(:item)

    visit "/items/#{item.id}"

    expect(page).to have_content(item.name)
    expect(page).to have_content(item.status)
    expect(page).to have_content(item.price)
    expect(page).to have_content(item.description)
    expect(page).to have_content(item.image)
    expect(page).to have_content(item.inventory)
    expect(page).to have_content(item.merchant.name)
  end
end
