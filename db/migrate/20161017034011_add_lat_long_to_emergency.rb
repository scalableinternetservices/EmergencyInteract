class AddLatLongToEmergency < ActiveRecord::Migration[5.0]
  def change
    change_table :events do |t|
      t.float :lat
      t.float :long
    end
  end
end
