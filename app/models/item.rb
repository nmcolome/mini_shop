class Item < ApplicationRecord
  belongs_to :merchant

  paginates_per 16

  enum status: [:active, :inactive]
end
