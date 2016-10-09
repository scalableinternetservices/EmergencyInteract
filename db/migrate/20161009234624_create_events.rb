class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.string :location
      t.integer :followers
      t.integer :interactions

      t.timestamps
    end
  end
end
