class AddDetailsToPost < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :kind, :string
    add_column :posts, :date_and_time, :string
    add_column :posts, :place, :string
    add_column :posts, :latitude, :float
    add_column :posts, :longitude, :float
  end
end
