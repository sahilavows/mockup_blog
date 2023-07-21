class HomeController < ApplicationController
  def index
    @users_states = User.group(params["key"].to_sym).count rescue User.group(:phone_number).count
    respond_to do |format|
      format.html{render layout: 'application'} 
      format.js {render layout: false} # Add this line to you respond_to block
    end
  end
  
  def d3_graph
    render layout: 'home'
  end 

  def report
   unless params["advance_search"].nil? 
     @report_states = Report.where("created_at BETWEEN ? AND ? " ,params["advance_search"]["from_date"],params["advance_search"]["to_date"]).order(params["advance_search"]["order_by"])  rescue []
   else
     @report_states = Report.all
   end
   @report_states = @report_states.empty? ? [] : @report_states  
   respond_to do |format|
      format.html{render layout: 'home'} 
      format.js {render layout: false} # Add this line to you respond_to block
    end
  end 

  def excel_generate
   @data = Report.all # Fetch data from your model
   respond_to do |format|
      format.xlsx
    end
  end 

end
