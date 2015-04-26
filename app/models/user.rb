class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :replies

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:omniauthable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauth_providers => [:facebook,:google_oauth2]

  include Gravtastic
  gravtastic

 	def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      #user.username = auth.info.last_name  # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
    end
  end

	def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(email: data["email"]).first

    unless user
      user = User.create(email: data["email"], password: Devise.friendly_token[0,20])
    end
    user
  end

  
end
