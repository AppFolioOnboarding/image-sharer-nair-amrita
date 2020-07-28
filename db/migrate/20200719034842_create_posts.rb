class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :image_posts do |t|
      t.string :title
      t.string :image

      t.timestamps
    end
  end
end
