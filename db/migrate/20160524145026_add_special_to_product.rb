class AddSpecialToProduct < ActiveRecord::Migration
  def change
    add_column :products, :onSpecial, :boolean
  end
end
