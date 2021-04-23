class Delivery < ApplicationRecord
  belongs_to :member
  def order_address
			"〒"+ self.postcode + self.address + self.name
  end
end
