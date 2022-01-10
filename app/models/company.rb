class Company < ApplicationRecord
  validates :number, { presence: true}
  validates :name, { presence: true}
  validates :information, { presence: true, length: { maximum: 1000 } }
  validates :user_id, {presence: true}
  belongs_to :user
  has_many :posts

  def user
    return User.find_by(id: self.user_id)
  end

end
