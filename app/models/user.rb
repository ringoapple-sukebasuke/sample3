class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, { presence: true, length: { maximum: 10 } }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :companys, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes

  def own?(object)
    id == object.user_id
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
  end
end
