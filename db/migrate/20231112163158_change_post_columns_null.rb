class ChangePostColumnsNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null :posts, :title, false
    change_column_null :posts, :content, false
    change_column_null :posts, :kind, false
    change_column_null :posts, :date_and_time, false
    change_column_null :posts, :place, false
  end
end
