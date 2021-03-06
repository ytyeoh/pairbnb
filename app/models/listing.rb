class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :reservations
	has_many :taggings, dependent: :destroy
	has_many :tags, through: :taggings
	mount_uploaders :avatars, AvatarUploader
	searchkick text_start: [:title], autocomplete: ['title']

	
	def all_tags=(names)
	  self.tags = names.split(",").map do |name|
	      Tag.where(name: name.strip).first_or_create!
	  end
	end

	def all_tags
	  self.tags.map(&:name).join(", ")
	end

end
