require 'rails_helper'

RSpec.describe Item do
  describe 'relationships' do
    it { should belong_to :merchant }
  end

  describe 'attributes' do
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :description }
    it { is_expected.to respond_to :price }
    it { is_expected.to respond_to :image }
    it { is_expected.to respond_to :status }
    it { is_expected.to respond_to :inventory }
    it { is_expected.to respond_to :merchant_id }
  end
end

# - description
# - price
# - image
# - active/inactive status
# - inventory
# - the name of the merchant that sells the item