class Gift < ApplicationRecord
  validates :name, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  def formatted_price
    format("R$ %.2f", price)
  end
end
