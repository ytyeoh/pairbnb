class TransactionsController < ApplicationController
  #before_action :require_login


    # protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token

  def new
    @reservation = Reservation.find(params[:reservation_id])
  end





	def create
    @reservation = Reservation.find(params[:reservation_id])
    # @result = Braintree::Transaction.sale(amount: '111.11',payment_method_nonce: params[:payment_method_nonce])
    @result = Braintree::Transaction.sale(amount: @reservation.total,payment_method_nonce: params[:payment_method_nonce])
    if @result.success?
      purchase = Purchase.new(reservation_id: params[:reservation_id])
      purchase.user_id = current_user.id
      purchase.paid = true
      purchase.save
      redirect_to root_url, notice: "Congraulations! Your transaction has been successfully!"
    else
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
      gon.client_token = generate_client_token
      redirect_to listing_reservation_path(@reservation.listing_id, @reservation.id)

    end
  end

private

	
def generate_client_token
	  if current_user.has_payment_info?
	    Braintree::ClientToken.generate(customer_id: current_user.braintree_customer_id)
	  else
	    Braintree::ClientToken.generate
	  end
end



	def check_cart!
	  if current_user.get_cart_reservations.blank?
	    redirect_to root_url, alert: "Please add some items to your cart before processing your transaction!"
	  end
	end
end
