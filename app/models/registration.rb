class Registration < ApplicationRecord

  # Define a method to generate fake data using Faker gem
  scope :with_medical_examination, -> { where(medical_examination: true).count }
  scope :with_certification, -> { where(certification: true).count }
  scope :with_result_released, -> { where(result_released: true).count }
  scope :with_xray_film_pending_review, -> { where(xray_film_pending_review: true).count }
  scope :with_xray_film_recived_by_xqcc, -> { where(xray_film_recived_by_xqcc: true).count }
  scope :with_xray_film_reviwed, -> { where(xray_film_reviwed: true).count }
  scope :with_result_transmitted_to_immigration, -> { where(result_transmitted_to_immigration: true).count }
  scope :with_block_fw, -> { where(block_fw: true).count }
  scope :with_appeal, -> { where(appeal: true).count }
  scope :group_by_year, -> { group("EXTRACT(YEAR FROM created_at)").count.transform_keys(&:to_i)}


  def self.generate_fake_data
    registration = Registration.new(
      medical_examination: Faker::Boolean.boolean,
      certification: Faker::Boolean.boolean,
      result_released: Faker::Boolean.boolean,
      xray_film_pending_review: Faker::Boolean.boolean,
      xray_film_recived_by_xqcc: Faker::Boolean.boolean,
      xray_film_reviwed: Faker::Boolean.boolean,
      result_transmitted_to_immigration: Faker::Boolean.boolean,
      block_fw: Faker::Boolean.boolean,
      appeal: Faker::Boolean.boolean,
      Time_period: Faker::Date.between(from: '2019-01-01', to: '2023-12-31').strftime("%B %Y"), # Fake time period
      sector: ['Agriculture sector','Services sector'].shuffle.first, # Fake sector
      state: ['1 State','2 State'].shuffle.first, # Fake state
      country: ['Indonesia','India'].shuffle.first, # Fake country
      age: ['18 to 29','30 to 45','50 to >'].shuffle.first, # Fake age range
      gender: Faker::Gender.binary_type, # Fake gender
      registration_at: ['Web Portal','Agency','Regional Office'].shuffle.first, # Fake registration location
      foregin_worker_type: ["RTK", "Normal"].sample, # Randomly select foreign worker type
      created_at: Faker::Date.between(from: '2019-01-01', to: '2023-12-31').strftime("%B %Y")
    )
    registration.save
  end

  def self.filter_registrations(params)
	  query = all

	  return query if params.blank?

	  # Filter by timePeriod (month and year)
	  if params[:timePeriod].present?
	    month = params[:timePeriod][:month]
	    year = params[:timePeriod][:year]
	    # query = query.where("EXTRACT(MONTH FROM time_period) = ? AND EXTRACT(YEAR FROM time_period) = ?", Date::MONTHNAMES.index(month), year)
	  end

	  # Apply other filters only when the corresponding params are present
	  query = query.where(sector: params[:sector]) if params[:sector].present?
	  query = query.where(state: params[:state]) if params[:state].present?
	  query = query.where(country: params[:country]) if params[:country].present?
	  query = query.where(age: params[:age]) if params[:age].present?
	  query = query.where(gender: params[:gender]) if params[:gender].present?
	  query = query.where(registration_at: params[:registration]) if params[:registration].present?
	  query = query.where(foregin_worker_type: params[:foreginWorkerType]) if params[:foreginWorkerType].present?

	  query
  end

end

