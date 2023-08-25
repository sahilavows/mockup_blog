class StateDatum < ApplicationRecord
  self.table_name = "state_data"
  belongs_to :state_name ,class_name: "StateName",optional: true
end
