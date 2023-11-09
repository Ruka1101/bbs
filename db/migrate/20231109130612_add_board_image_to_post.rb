class AddBoardImageToPost < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :board_image, :string
  end
end
