class RenameTitleColumnToMessages < ActiveRecord::Migration[7.1]
  def change
    rename_column :messages, :title, :subject
  end
end
