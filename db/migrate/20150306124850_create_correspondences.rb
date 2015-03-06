class CreateCorrespondences < ActiveRecord::Migration
  def change
    create_table :correspondences do |t|
      t.string :corres_type
      t.string :first_name
      t.string :last_name
      t.string :comapny
      t.string :designation
      t.string :contact_number
      t.string :email
      t.string :industry
      t.string :location
      t.text :additional_info

      t.timestamps
    end
  end
end
