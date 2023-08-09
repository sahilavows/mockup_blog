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
    pdf = generate_pdf_1
    send_data pdf, filename: 'example.pdf', type: 'application/pdf', disposition: 'attachment'
  end 

  def generate_excel
     @data = Report.all # Fetch data from your model
     respond_to do |format|
        format.xlsx
      end
  end 

  private
    def data_creation 
      c = ISO3166::Country.find_country_by_iso_short_name('malaysia')
      @states = c.states.map{|i| i[1].name}
      @countries = ISO3166::Country.all_translated
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

    def generate_pdf_1
      # Initialize a headless browser (you can use other drivers like Chrome, Firefox, etc. as well)
      options = Selenium::WebDriver::Chrome::Options.new
      options.add_argument('--headless')
      driver = Selenium::WebDriver.for(:chrome, options: options)

      begin
        # Load the web page
        driver.navigate.to 'http://localhost:3000/dashboard/dashboard_1' # Replace with the URL you want to generate PDF for

        # Wait for the page to load (you can adjust the wait time if needed)
        wait = Selenium::WebDriver::Wait.new(timeout: 10)
        wait.until { driver.execute_script('return document.readyState') == 'complete' }

        # Get the rendered HTML after the page is loaded
        rendered_html = driver.page_source

        # Convert the HTML to PDF using Wicked PDF
        pdf = WickedPdf.new.pdf_from_string(rendered_html)

        # Save or send the PDF file as you prefer
        # File.open('output.pdf', 'wb') { |file| file << pdf }
      ensure
        # Close the headless browser after use
        driver.quit if driver
      end
      pdf 
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
