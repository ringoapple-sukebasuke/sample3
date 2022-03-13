class Company < ApplicationRecord
  validates :number, { presence: true, length: { maximum: 4 } }
  validates :name, { presence: true, length: { maximum: 20 } }
  validates :information, { presence: true, length: { maximum: 1000 } }
  validates :user_id, { presence: true }

  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_many :comments, dependent: :destroy
  has_many :likes

  has_many :company_tags
  has_many :tags, through: :company_tags

  def user
    User.find_by(id: user_id)
  end

  def tags_save(tag_list)
    if self.tags != nil
      company_tags_records = CompanyTag.where(company_id: self.id)
      company_tags_records.destroy_all
    end

    tag_list.each do |tag|
      inspected_tag = Tag.where(tag_name: tag).first_or_create
      self.tags << inspected_tag
    end
  end
end
