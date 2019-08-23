require 'rails_helper'

RSpec.describe Merchant do
  describe 'attributes' do
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :address }
    it { is_expected.to respond_to :city }
    it { is_expected.to respond_to :state }
    it { is_expected.to respond_to :zip }
  end
end
