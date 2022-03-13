class Tag < ApplicationRecord
  has_many :company_tags
  has_many :companys, through: :company_tags
end
