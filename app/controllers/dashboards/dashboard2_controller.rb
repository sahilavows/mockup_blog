class Dashboards::Dashboard2Controller < ApplicationController
  def dashboard_2
    @state_names = StateName.select(:name)
    if params[:state_name].present?
      @state_name = StateName.includes(:state_data).find_by(name: params[:state_name]) || StateName.includes(:state_data).first
      @state_data = @state_name&.state_data&.first
    else
      @state_name = HashWithIndifferentAccess.new
      @state_name[:name] = "Malasiya"
      @state_data = default_data
    end 
  end

  private
    def default_data
      # Initialize an empty hash to store the consolidated data
      consolidated_data = {
      doctors_no: 0,
      x_ray_count: 0,
      lab_count: 0,
      employer_count: 0,
      fw_count: 0,
      desease_detected_count: 0
      }

      # Retrieve all records from the StateDatum table
      state_data_records = StateDatum.all

      # Loop through each record and update the consolidated data hash
      state_data_records.each do |record|
      consolidated_data[:doctors_no] += record.doctors_no
      consolidated_data[:x_ray_count] += record.x_ray_count
      consolidated_data[:lab_count] += record.lab_count
      consolidated_data[:employer_count] += record.employer_count
      consolidated_data[:fw_count] += record.fw_count
      consolidated_data[:desease_detected_count] += record.desease_detected_count
      end

      # Print the consolidated data hash
      return consolidated_data

    end
end
