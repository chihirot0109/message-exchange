class User < ApplicationRecord
  before_save :capitalize_name
  before_update :capitalize_name
  after_create :create_conversations

  has_many :conversations, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  def capitalize_name
    self.first_name = first_name.capitalize
    self.last_name = last_name.capitalize
  end

  def create_conversations
    users = User.where.not('id = ?', self.id)
    users.each do |user|
      Conversation.create(user: self, recipient_id: user.id)
    end
  end
end
