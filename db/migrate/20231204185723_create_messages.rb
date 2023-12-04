class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.string :sender_name, null: false
      t.string :sender_email, null: false
      t.string :receiver_name, null: false
      t.string :receiver_email, null: false
      t.string :title, null: false
      t.string :content, null: false

      t.timestamps
    end
  end
end
