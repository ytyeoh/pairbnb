class User < ActiveRecord::Base
  has_many :listings
  include Clearance::User
def self.create_with_omniauth(auth)
  create! do |user|
  	user.password = SecureRandom.base64
    user.provider = auth['provider']
    user.uid = auth['uid']
    if auth['info']
      user.name = auth['info']['name'] || ""
      user.email = auth['info']['email'] || ""
    end
  end
end

	
end
