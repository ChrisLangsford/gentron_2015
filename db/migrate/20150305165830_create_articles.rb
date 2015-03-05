class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :body
      t.string :link
      t.string :link_display_text
      t.string :reference

      t.timestamps
    end
  end
end
