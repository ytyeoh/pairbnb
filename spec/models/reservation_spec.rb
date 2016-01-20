require 'rails_helper'

RSpec.describe Reservation, type: :model do
  context "GET new" do
  	it "returns http success" do
			get :new
			expect(assigns(:reservation)).to eq Reservation.all

			expect(response).to have_http_status(:success)
			expect(response).to render_template(:new)
		end
	end
end
