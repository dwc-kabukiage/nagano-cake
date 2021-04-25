class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :deliveries, dependent: :destroy

  #ログインする時に退会済み(is_deleted==true)のユーザーを弾くためのメソッド
  #ログインしようとしているuserがにんしょうかのうかどうか -> true or false;
  #user.is_deletedがfalseのときにtrueをかえす.
  validates :last_name, presence: true
  validates :last_name_kana, format: { with:/\A[\p{katakana}]+\z/}
  validates :first_name, presence: true
  validates :first_name_kana, format: { with:/\A[\p{katakana}]+\z/}
  validates :address, presence: true
  validates :postcode, format: {with: /\A\d{7}\z/}
  validates :phone_number, format: { with: /\A\d{10,11}\z/}
  
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end
