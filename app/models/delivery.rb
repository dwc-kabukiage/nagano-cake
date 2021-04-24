class Delivery < ApplicationRecord

 belongs_to :member
validates :postcode, format: {with: /\A\d{7}\z/}
validates :address, presence: true
validates :name, presence: true
end
