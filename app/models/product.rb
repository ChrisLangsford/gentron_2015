class Product < ActiveRecord::Base
searchable do
  text :name, :boost => 5
  text :description
end

end
