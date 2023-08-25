Rails.application.routes.draw do
  get 'final_design1/index'
  namespace :dashboards do
    get 'dashboard2/dashboard_2'
    get 'dashboard2/dashboard_2_option_2' 
    get 'dashboard1/dashboard_1'
    get 'dashboard3/dashboard_3'
    get 'dashboard4/dashboard_4'
    get 'dashboard5/dashboard_5'
  end
  
  get '/dashboard_2',to:'dashboard_2#index'
  get 'dashboard/dashboard_1'
  get 'home/index'
  get 'home/d3_graph'
  get 'home/report' 
  get 'home/excel_generate' , defaults: { format: :xlsx }
  get 'home/pdf_gen' , defaults: { format: :pdf}
  get '/generate_pdf',to:'dashboard#generate_pdf', defaults: { format: :pdf}
  get '/generate_excel',to:'dashboard#generate_excel', defaults: { format: :xlsx }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
