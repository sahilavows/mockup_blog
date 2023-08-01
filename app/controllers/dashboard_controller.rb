class DashboardController < ApplicationController
  before_action :data_creation

  def dashboard_1
    # @registration = Registration.filter_registrations(params[:data])
    respond_to do |format|
      format.html{render layout: 'application'} 
      format.js {render layout: false} # Add this line to you respond_to block
    end
  end

  def generate_pdf
    @report_states = Report.all 
    respond_to do |format|
      format.pdf do
        pdf = WickedPdf.new.pdf_from_string(
                # render_to_string(partial: "dashboard/left_bar_chart",formats: [:html],local: {left_bar_chart_data: @left_bar_chart_data},layout: 'pdf_layout')
                # render_to_string(partial: "dashboard/dashboard_body",formats: [:html],local: {},layout: 'pdf_layout')
                render_to_string(template: "dashboard/dashboard_1",formats: [:html],local: {},layout: 'pdf_layout')
              )
              send_data pdf, filename: 'your_file_name.pdf', type: 'application/pdf', disposition: 'attachment'
        end
    end 
  end 

  def generate_excel
     @data = Report.all # Fetch data from your model
     respond_to do |format|
        format.xlsx
      end
  end 

  private
    def data_creation 
      @registration = Registration.filter_registrations(params[:data])
      @yearly_data = @registration.group_by_year
      @right_chart_data = [
                                      ["Element", "Density", {
                                        role: "style"
                                      }],
                                      ["medical_examination", @registration.with_medical_examination, "#b87333"],
                                      ["certification", @registration.with_certification, "certification"],
                                      ["result_released", @registration.with_result_released, "result_released"],
                                      ["xray_film_pending_review", @registration.with_xray_film_pending_review, "color: #e5e4e2"]
                                    ]
      @center_pi_chart_data = [
                                      ['Data', 'Value'],
                                      ['xray_film_pending_review', @registration.with_xray_film_pending_review],
                                      ['result_released', @registration.with_result_released],
                                      ['certification', @registration.with_certification],
                                      ['medical_examination', @registration.with_medical_examination],
                                      ['xray_film_recived_by_xqcc', @registration.with_xray_film_recived_by_xqcc]
                                    ]
      @left_bar_chart_data = [
                                      ["Element", "Density", {
                                        role: "style"
                                      }],
                                      ["medical_examination", @registration.with_medical_examination, "#b87333"],
                                      ["certification", @registration.with_certification, "certification"],
                                      ["block_fw", @registration.with_block_fw, "block_fw"],
                                      ["appeal", @registration.with_appeal, "color: #e5e4e2"]
                                    ]
      @bottom_line_chart_data = [
                                    ['Month', 'Year 2019', 'Month'],
                                    ['January', 7, 5.5],
                                    [' February ', 8, 8.5],
                                    ['March ', 7, 7.5],
                                    ['April ', 6, 5],
                                    ['May ', 8, 7],
                                    ['June ', 8, 7.5],
                                    ['July ', 7, 7.5],
                                    [' August ', 6, 6],
                                    ['September ', 8, 7.6],
                                    ['October ', 9, 8],
                                    ['November ', 9, 8.5],
                                    ['December', 10, 9.5]
                                  ]                      
    end 
end
