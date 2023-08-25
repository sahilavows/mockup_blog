class StateName < ApplicationRecord
  has_many :state_data,class_name: "StateDatum"
end
