class CreateStateData < ActiveRecord::Migration[7.0]
  def change
    create_table :state_data do |t|
      t.integer :state_name_id
      t.integer :doctors_no
      t.integer :x_ray_count
      t.integer :lab_count
      t.integer :employer_count
      t.integer :fw_count
      t.integer :desease_detected_count

      t.timestamps
    end
  end
end
