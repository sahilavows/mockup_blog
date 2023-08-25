class CreateStateNames < ActiveRecord::Migration[7.0]
  def change
    create_table :state_names do |t|
      t.string :name

      t.timestamps
    end
  end
end
