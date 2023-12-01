# frozen_string_literal: true

class Proponent < ApplicationRecord
  has_one :address, dependent: :destroy
  has_many :contact_phones, dependent: :destroy

  validates :name, :cpf, :birthdate, presence: true
  validates :cpf, length: { is: 14 }

  def update(params)
    UpdateWageJob.perform_async(id, params[:wage])

    super(params.except(:wage))
  end
end
