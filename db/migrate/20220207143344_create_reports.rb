class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :user_id, null: false
      t.integer :review_id, null: false
      t.text :report_text, null: false
      t.timestamps
    end
  end
end
