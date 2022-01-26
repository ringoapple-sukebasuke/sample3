class Comment < ApplicationRecord
  validates :body, { presence: true, length: { maximum: 1000 } }

  belongs_to :user
  belongs_to :company


  def user
    return User.find_by(id: self.user_id)
  end
end
