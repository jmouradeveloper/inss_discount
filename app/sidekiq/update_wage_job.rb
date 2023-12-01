class UpdateWageJob
  include Sidekiq::Job

  def perform(proponent_id, new_wage)
    proponent = Proponent.find(proponent_id)
    proponent.update_columns(wage: new_wage)
  end
end
