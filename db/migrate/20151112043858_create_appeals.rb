class CreateAppeals < ActiveRecord::Migration
  def change
    create_table :appeals do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.string :contact

      t.timestamps null: false
    end
  end
end
