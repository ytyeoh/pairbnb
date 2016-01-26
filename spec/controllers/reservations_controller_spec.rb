require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do

	describe "GET #show" do 
		let( :valid_params) 	{ {listing_id: 1, id: 1} }
		let( :invalid_params)	{ {id: "gt"} }

		context "when valid params" do
			it "should return value" do
				@user = User.create(email: 'me@example.com', password: '123456', braintree_customer_id: 1234)
				sign_in_as @user
				get :show, valid_params
				# let (current_user.has_payment_info?) {true} 
				expect{@reservation}.not_to eq nil
			end
		end
	end




end
