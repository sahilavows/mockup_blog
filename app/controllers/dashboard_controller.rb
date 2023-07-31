class DashboardController < ApplicationController
  before_action :data_creation

  def dashboard_1
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
      @right_chart_data = [
                                      ["Element", "Density", {
                                        role: "style"
                                      }],
                                      ["Copper", 18.94, "#b87333"],
                                      ["Silver", 10.49, "silver"],
                                      ["Gold", 19.30, "gold"],
                                      ["Platinum", 21.45, "color: #e5e4e2"]
                                    ]
      @center_pi_chart_data = [
                                      ['Task', 'Hours per Day'],
                                      ['Work', 11],
                                      ['Eat', 2],
                                      ['Commute', 2],
                                      ['Watch TV', 2],
                                      ['Sleep', 7]
                                    ]
      @left_bar_chart_data = [
                                      ["Element", "Density", {
                                        role: "style"
                                      }],
                                      ["Copper", 8.94, "#0e7dc1"],
                                      ["Silver", 10.49, "#29A6A6."],
                                      ["Gold", 119.30, "#A52A2A"],
                                      ["Platinum", 21.45, "color: #e5e4e2"]
                                    ]
      @bottom_line_chart_data = [
                                      ['Year', 'Sales', 'Expenses'],
                                      ['2004', 1000, 400],
                                      ['2005', 1170, 460],
                                      ['2006', 660, 1120],
                                      ['2007', 1030, 540]
                                    ]                      
    end 

end
