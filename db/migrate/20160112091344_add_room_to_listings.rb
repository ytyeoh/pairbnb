class AddRoomToListings < ActiveRecord::Migration
  def change
    add_column :listings, :room_type, :string
    add_column :listings, :accommodates, :integer
    add_column :listings, :location, :string
  end
end
