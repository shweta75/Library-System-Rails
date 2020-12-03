class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :confirmable, :lockable, :timeoutable,
         :omniauthable,
         :omniauth_providers => [:microsoft_office365, :linkedin, :google_oauth2, :facebook, :github]

  # This method will be adding the user to database who are signing in using social media accounts.
  def self.from_omniauth(auth)
    user = find_or_create_by(uid: auth.id, provider: auth.provider)
    user.email = auth.info.email
    user.password = SecureRandom.base64(15)
    user.confirmed_at = Time.now
    user.save(validate: false)
    user
  end
end