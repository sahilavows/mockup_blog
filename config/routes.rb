Rails.application.routes.draw do
  get 'home/index'
  get 'home/d3_graph'
  get 'home/report'
  get 'home/excel_generate' , defaults: { format: :xlsx }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
