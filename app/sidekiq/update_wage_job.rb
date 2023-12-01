# frozen_string_literal: true

class UpdateWageJob
  include Sidekiq::Job

  # rubocop:disable Rails::SkipsModelValidations
  def perform(proponent_id, new_wage)
    proponent = Proponent.find(proponent_id)
    proponent.update_columns(wage: new_wage)
  end
  # rubocop:enable Rails::SkipsModelValidations
end
