class Company < ApplicationRecord
  validates :number, { presence: true, length: { maximum: 4 } }
  validates :name, { presence: true, length: { maximum: 20 } }
  validates :information, { presence: true, length: { maximum: 1000 } }
  validates :user_id, { presence: true }

  belongs_to :user
  has_many :comments, dependent: :destroy

  def user
    User.find_by(id: user_id)
  end
end
