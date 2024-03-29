class OrderDetail < ApplicationRecord


  belongs_to :order
  belongs_to :item

  enum making_status: { impossible: 0, waiting: 1, production: 2, complete: 3 }

  def subtotal
    item.with_tax_price * amount
  end

end
