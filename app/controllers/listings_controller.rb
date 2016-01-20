class ListingsController < ApplicationController

	def index
		# @listing = Listing.all
    if params[:query].present?
      @listings = Listing.search(params[:query])
    else
      @listings = Listing.all
    end
	end

	def new
		@listing = Listing.new
	end

  def edit
    @listing= Listing.find_by( id: params[:id], user_id: current_user)
  end

  def update
    @listing= Listing.find_by( id: params[:id], user_id: current_user)
    @listing.update(listing_params)
    redirect_to "/"
   
  end

  def create
  	@listing = current_user.listings.new(listing_params)
  	@listing.save
  	redirect_to listing_path(@listing)

  end

  def show
  	@listing = Listing.find(params[:id])
  end

    def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy  #cannot delete
    redirect_to "/"
  end

  def autocomplete
    render json: Listing.search(params[:query], autocomplete: true, limit: 10).map(&:title)
  end

  private
  def listing_params
  	params.require(:@listing).permit(:title, :desc, :price, :location, :accommodates, :room_type, :all_tags, {avatars: []})
  end
end