class Item < ApplicationRecord
  has_one_attached :image


  belongs_to :genre
  has_many :cart_items
  has_many :order_details

  def add_tax_price
    (self.price * 1.10).round
    # round => 四捨五入
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end