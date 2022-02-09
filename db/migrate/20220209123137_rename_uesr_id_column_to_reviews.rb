class RenameUesrIdColumnToReviews < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :uesr_id, :user_id
  end
end
