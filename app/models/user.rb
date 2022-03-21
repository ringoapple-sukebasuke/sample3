class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, { presence: true, length: { maximum: 10 } }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :companys, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

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
