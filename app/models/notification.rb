class Notification < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :comment, optional: true

  belongs_to :visitor, class_name: 'User', optional: true
  belongs_to :visited, class_name: 'User', optional: true
end
