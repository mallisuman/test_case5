class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories, :primary_key => :cid do |t|
      t.string :name
      t.timestamps
    end
  end
end
