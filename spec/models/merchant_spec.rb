require 'rails_helper'

RSpec.describe Merchant do
  describe 'attributes' do
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :address }
    it { is_expected.to respond_to :city }
    it { is_expected.to respond_to :state }
    it { is_expected.to respond_to :zip }
  end

  describe 'relationships' do
    it { should have_many :items }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :address }
    it { is_expected.to validate_presence_of :city }
    it { is_expected.to validate_presence_of :state }
    it { is_expected.to validate_presence_of :zip }
  end
end
