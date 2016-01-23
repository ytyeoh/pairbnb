class Reservation < ActiveRecord::Base
	belongs_to :listing
	belongs_to :user
	has_one :purchase
	validates :check_in, presence: true
	validates :check_out, presence: true
	validates :guests, presence: true, numericality: { only_integer: true }
end
