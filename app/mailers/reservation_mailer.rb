class ReservationMailer < ApplicationMailer
	def booking_email(reservation)
		@reservation = reservation
		@host = @reservation.listing.user.email
		@customer = @reservation.user.name
		mail(to: @host, subject: "You have received a booking from #{@customer}")
	end
end
