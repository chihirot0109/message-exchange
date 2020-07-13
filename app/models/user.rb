class User < ApplicationRecord
  before_save :capitalize_name
  before_update :capitalize_name

  has_many :conversations, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  def capitalize_name
    self.first_name = first_name.capitalize
    self.last_name = last_name.capitalize
  end

  def conversations
    Conversation.where(starter_id: id).or(Conversation.where(recipient_id: id))
  end
end
