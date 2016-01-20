class User < ActiveRecord::Base
  has_many :listings
  has_many :reservations
  has_many :purchases

  mount_uploader :avatar, AvatarUploader
  include Clearance::User
def self.create_with_omniauth(auth)
  create! do |user|
  	user.password = SecureRandom.base64
    user.provider = auth['provider']
    user.uid = auth['uid']
    if auth['info']
      user.name = auth['info']['name'] || ""
      user.image = auth['info']['image'] || ""
      user.email = auth['info']['email'] || ""
      
    end
  end
end

def cart_total_price
  total_price = 0
  get_cart_reservations.each { |reservation| total_price+= reservation.price }
  total_price
end


def has_payment_info?
  braintree_customer_id
end

def purchase_cart_reservations!
  get_cart_reservations.each { |reservation| purchase(reservation) }
  $redis.del "cart#{id}"
end

def purchase(reservation)
  movies << reservation unless purchase?(reservation)
end

def purchase?(reservation)
  movies.include?(reservation)
end
	
end
