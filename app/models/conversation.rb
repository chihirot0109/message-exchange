class Conversation < ApplicationRecord
  belongs_to :starter, foreign_key: :starter_id, class_name: 'User'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'
  has_many :messages
end
