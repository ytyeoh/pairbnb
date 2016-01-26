class ReservationsController < ApplicationController
  def index
  end

  def new
    @reservation= Reservation.new
  end

  def edit
  end

  def show

    @braintree_token = generate_client_token
    byebug
    @reservation = Reservation.find(params[:id])
    @listing = Listing.find(params[:listing_id])
  end

  def update
  end

  def destroy
  end
  def create
 
   
    @listing_id = params[:listing_id]
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.listing_id = @listing_id
    @reservation.total = listing_total
    if @reservation.save
      # # ReservationJob.perform_later(@reservation)
      # @client_token = Braintree::ClientToken.generate(:customer_id => current_user.id)
      # ReservationMailer.booking_email(@reservation).deliver_now


      redirect_to listing_reservation_path(@listing_id, @reservation.id)

    else
      render :new
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

  def reservation_params
    params.require(:@reservation).permit(:check_in, :check_out, :guests, :listing_id, :user_id)
  end

  def listing_total

     ((params[:@reservation][:check_out].to_date - params[:@reservation][:check_in].to_date).to_i)*Listing.find(params[:listing_id]).price ||"111"
  end


end
