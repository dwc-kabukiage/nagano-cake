class Order < ApplicationRecord

    belongs_to :member
    has_many :order_details
    validates :postcode, format: {with: /\A\d{7}\z/}
    validates :member_id,:address, :name, :claim,  presence: true
    enum payment: { "クレジットカード": 0, "銀行振込": 1 }
    enum received_status: { "入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4 }
end
