class User < ApplicationRecord
  acts_as_token_authenticatable
  has_many :sns_credentials, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :validatable, :confirmable

  def conversations
    Conversation.where(starter_id: id).or(Conversation.where(recipient_id: id))
  end

  def self.without_sns_data(auth)
    user = User.find_by(email: auth.info.email)
    if user.present?
      sns = SnsCredential.create(
        uid: auth.uid,
        provider: auth.provider,
        user_id: user.id
      )
    else
      user = User.new(
        name: auth.info.name,
        email: auth.info.email
      )
      sns = SnsCredential.new(
        uid: auth.uid,
        provider: auth.provider
      )
    end
    return { user: user, sns: sns }
  end

  def self.with_sns_data(auth, snscredential)
    user = User.find(snscredential.user_id)
    unless user.present?
      user = User.new(
        name: auth.info.name,
        email: auth.info.email
      )
    end
    return { user: user }
  end

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = with_sns_data(auth, snscredential)[:user]
      sns = snscredential
    else
      user = without_sns_data(auth)[:user]
      sns = without_sns_data(auth)[:sns]
    end
    return { user: user, sns: sns }
  end
end
