class FinalDesign1Controller < ApplicationController
  before_action :data_creation,only: [:index]

  def index
    respond_to do |format|
      format.html{render layout: 'application'} 
      format.js {render layout: false} # Add this line to you respond_to block
    end
  end

  private
    def data_creation
      c = ISO3166::Country.find_country_by_iso_short_name('malaysia')
      @states = c.states.map{|i| i[1].name}
      @countries = ISO3166::Country.all_translated
      data = params[:data]
      data = eval(params["pdf_data"].gsub('=>', ':')) if params["pdf_data"].present?
      @registration = Registration.filter_registrations(data)
      @yearly_data = @registration.group_by_year
      @right_chart_data = [
                                   
                                      ["medical_examination", @registration.with_medical_examination],
                                      ["certification", @registration.with_certification],
                                      ["result_released", @registration.with_result_released],
                                      ["xray_film_pending_review", @registration.with_xray_film_pending_review],
                                      ["medical_examination", @registration.with_medical_examination],
                                      ["certification", @registration.with_certification],
                                      ["result_released", @registration.with_result_released],
                                      ["xray_film_pending_review", @registration.with_xray_film_pending_review]
                                    ]
      @center_pi_chart_data = [
                                      ['Data', 'Value'],
                                      ['xray_film_pending_review', @registration.with_xray_film_pending_review],
                                      ['result_released', @registration.with_result_released],
                                      ['certification', @registration.with_certification],
                                      ['medical_examination', @registration.with_medical_examination],
                                      ['xray_film_recived_by_xqcc', @registration.with_xray_film_recived_by_xqcc]
                                    ]
      @left_bar_chart_data =     [
                                            ["Selangor",  @registration.with_medical_examination],
                                            ["Bangladesh", @registration.with_appeal],
                                              ["Nepal", @registration.with_block_fw],
                                              ["Indonesia",@registration.with_block_fw],
                                              ["Myanmar", @registration.with_appeal],
                                              ["India", @registration.with_certification],
                                              ["Pakistan",@registration.with_appeal],
                                              ["Philippins",@registration.with_certification],
                                              ["Srilanks", @registration.with_block_fw],
                                                  ["Other", @registration.with_appeal,]
                                            ]
      @bottom_line_chart_data = bar_graph 
      # @bottom_line_chart_data = [
      #                              ['Month', 'Year 2019', 'Month'],
      #                              ['January', 7, 5.5],
      #                              [' February ', 8, 8.5],
      #                              ['March ', 7, 7.5],
      #                              ['April ', 6, 5],
      #                              ['May ', 8, 7],
      #                              ['June ', 8, 7.5],
      #                              ['July ', 7, 7.5],
      #                              [' August ', 6, 6],
      #                              ['September ', 8, 7.6],
      #                              ['October ', 9, 8],
      #                              ['November ', 9, 8.5],
      #                              ['December', 10, 9.5]
      #                            ]                                               
    end

    def bar_graph
      year =  params[:data][:timePeriod][:year] rescue nil
      year = year.nil? ? Time.new.year.to_s : year
      @data = [['Month', "#{year}","Month"]]
      
      records = Registration.where(created_at: "#{year}-01-01".."#{year}-12-31")

      (1..12).each do |month|
        count = records.where("EXTRACT(MONTH FROM created_at) = ?", month).count
        @data << [Date::MONTHNAMES[month], count,count-0.1]
      end
      @data
    end 

end
