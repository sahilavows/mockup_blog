class CreateRegistrations < ActiveRecord::Migration[7.0]
  def change
    create_table :registrations do |t|
      t.boolean :medical_examination
      t.boolean :certification
      t.boolean :result_released
      t.boolean :xray_film_pending_review
      t.boolean :xray_film_recived_by_xqcc
      t.boolean :xray_film_reviwed
      t.boolean :result_transmitted_to_immigration
      t.boolean :block_fw
      t.boolean :appeal
      t.string :Time_period
      t.string :sector
      t.string :state
      t.string :country
      t.string :age
      t.string :gender
      t.string :registration_at
      t.string :foregin_worker_type

      t.timestamps
    end
  end
end
