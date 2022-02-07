class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :uesr_id, null: false
      t.integer :genre_id, null: false
      t.string :title, null: false
      t.string :image_id
      t.text :good_point, null: false
      t.text :bad_point, null: false
      t.float :evaluation, null: false
      t.timestamps
    end
  end
end
