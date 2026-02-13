class CreateRsvps < ActiveRecord::Migration[7.1]
  def change
    create_table :rsvps do |t|
      t.string :name, null: false
      t.boolean :attending, null: false
      t.timestamps
    end
  end
end
