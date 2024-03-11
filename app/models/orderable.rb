class Orderable < ApplicationRecord
  belongs_to :market
  belongs_to :cart
  def total
    market.price * quantity
  end
end
