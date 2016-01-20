class AddAvatarsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :avatars, :json
    add_column :listings, :price, :integer
    
  end
end
