class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_items, dependent: :destroy
  has_many :order_details
  attachment :image

  validates :name, presence: true
  validates :body, presence: true
  validates :price, presence: true
  validates :price, numericality: {only_integer: true}
  validates :is_active, inclusion: {in: [true, false]}

end
