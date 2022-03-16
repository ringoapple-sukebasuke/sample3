class Like < ApplicationRecord
  validates :user_id, { presence: true }
  validates :company_id, { presence: true }

  belongs_to :user
  belongs_to :company
end
