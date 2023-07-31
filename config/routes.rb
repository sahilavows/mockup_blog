Rails.application.routes.draw do
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
