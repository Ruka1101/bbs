class AddPostIdToMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :post_id, :integer
  end
end
