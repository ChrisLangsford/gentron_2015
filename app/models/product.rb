class Product < ActiveRecord::Base
	has_attached_file :picture, :styles => { :medium => "600x230>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

	searchable do
		text :name, :boost => 5
		text :description
	end
end
