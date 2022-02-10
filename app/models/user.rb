class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, { presence: true, length: { maximum: 20 } }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :companys, dependent: :destroy
  has_many :comments, dependent: :destroy

  def own?(object)
    id == object.user_id
  end
end
