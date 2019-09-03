class Item < ApplicationRecord
  belongs_to :merchant

  paginates_per 16

  enum status: [:active, :inactive]

  validates :name, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :inventory, presence: true
end
