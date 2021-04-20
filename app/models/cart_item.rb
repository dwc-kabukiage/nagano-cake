class CartItem < ApplicationRecord
  belongs_to :member, optional: true
  belongs_to :product, optional: true
end
