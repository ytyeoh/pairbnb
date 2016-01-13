class ListingsController < ApplicationController

	def index
		@listing = Listing.all
	end

	def new
		@listing = Listing.new
	end

  def create
  
  	@listing = current_user.listings.new(listing_params)
  	byebug
  	 @listing.save
  	redirect_to listing_path(@listing)

  end

  def show
  	@listing = Listing.find(params[:id])
  end

  private
  def listing_params
  	params.require(:@listing).permit(:title, :desc, :price, :location, :accommodates, :room_type, :tag)
  end
end