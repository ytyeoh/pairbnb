require 'rails_helper'

RSpec.describe Reservation, type: :model do

	context "validation: " do
		it { is_expected.to validate_presence_of(:check_in) }

		it { is_expected.to validate_presence_of(:check_out) }

		it { is_expected.to allow_value(2).for(:guests) }
		it { is_expected.to validate_presence_of(:guests) }
		it {is_expected.to validate_numericality_of(:guests) }
	end


	context "accociation" do 
		# it { is_expected belong_to (:listing }
	end


	# context "GET new" do
	# 	it "returns http success" do
	# 		get :new
	# 		expect(assigns(:reservation)).to eq Reservation.all

	# 		expect(response).to have_http_status(:success)
	# 		expect(response).to render_template(:new)
	# 	end
	# end

	




end
