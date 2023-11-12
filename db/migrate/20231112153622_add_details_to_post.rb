class AddDetailsToPost < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :kind, :string
    add_column :posts, :date_and_time, :string
    add_column :posts, :place, :string
  end
end
