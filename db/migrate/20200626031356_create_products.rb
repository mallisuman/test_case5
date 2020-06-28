class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :uid
      t.integer :cid

      t.string :name

      t.timestamps
    end
  end
end
