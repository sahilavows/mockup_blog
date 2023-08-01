class Report < ApplicationRecord

  # Define a method to generate fake data using Faker gem
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
      registration_at: ['Web Portal','Agency','Regional Office'], # Fake registration location
      foregin_worker_type: ["RTK", "Normal"].sample, # Randomly select foreign worker type
      created_at: Faker::Date.between(from: '2019-01-01', to: '2023-12-31').strftime("%B %Y")
    )
    registration.save
  end

end
