class Category < ActiveRecord::Base
	has_many :products

	def self.with_products
	 self.joins(:products).select("categories.name as c_name", "products.name", :pricing, :description) 
	end
end
