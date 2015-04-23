class Article < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "600x230>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	validates :title,  presence: true
	validates :title, uniqueness: true
end
