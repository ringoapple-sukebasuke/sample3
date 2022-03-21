class Comment < ApplicationRecord
  validates :body, { presence: true, length: { maximum: 1000 } }

  belongs_to :user
  belongs_to :company
  has_many :notifications, dependent: :destroy

  def user
    User.find_by(id: user_id)
  end
end
