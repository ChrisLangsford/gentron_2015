class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :company_name
      t.string :industry
      t.text :work_description
      t.text :feedback_description
      t.integer :rating

      t.timestamps
    end
  end
end
