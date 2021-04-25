class CartItem < ApplicationRecord

    belongs_to :member
    belongs_to :product

    validates :number, :numericality => true

end
