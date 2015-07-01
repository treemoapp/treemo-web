class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :locations, dependent: :destroy

  def self.from_omniauth(auth)
    where(provider: auth["provider"], uid: auth["uid"]).first_or_create do |user|

      user.email = auth["info"]["email"] unless auth["info"]["email"].blank?
      user.password = Devise.friendly_token[0,20]
      user.name = auth["info"]["name"] unless auth["info"]["name"].blank?  # assuming the user model has a name
      user.image = auth["info"]["image"] unless auth["info"]["image"].blank? # assuming the user model has an image
    end
  end

end
