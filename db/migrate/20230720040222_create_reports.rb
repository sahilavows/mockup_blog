class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.integer :user_id
      t.boolean :passed
      t.string :doctor_name
      t.string :visa_type
      t.boolean :purchased_insurence

      t.timestamps
    end
  end
end
