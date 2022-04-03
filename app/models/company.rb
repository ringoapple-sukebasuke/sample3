class Company < ApplicationRecord
  validates :number, { presence: true, length: { maximum: 4 } }
  validates :name, { presence: true, length: { maximum: 20 } }
  validates :information, { presence: true, length: { maximum: 1000 } }
  validates :total, { presence: true }
  validates :dividend, { presence: true }
  validates :user_id, { presence: true }

  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :notifications, dependent: :destroy

  def user
    User.find_by(id: user_id)
  end

  def create_notification_like!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and company_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        company_id: id,
        visited_id: user_id,
        action: 'like'
      )
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def create_notification_comment!(current_user, comment_id)
    temp_ids = Comment.select(:user_id).where(company_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    notification = current_user.active_notifications.new(
      company_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

  def self.sort(selection)
    case selection
    when 'likes'
      return find(Like.group(:company_id).order(Arel.sql('count(company_id) desc')).pluck(:company_id))
    when 'dislikes'
      return find(Like.group(:company_id).order(Arel.sql('count(company_id) asc')).pluck(:company_id))
    when 'number'
      return all.order(number: :desc)
    when 'large'
      return all.order(total: :desc)
    when 'small'
      return all.order(total: :asc)
    when 'high'
      return all.order(dividend: :desc)
    when 'low'
      return all.order(dividend: :asc)
    end
  end
end
