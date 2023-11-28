# frozen_string_literal: true

class Proponent < ApplicationRecord
  has_one :address
  has_many :contact_phones

  validates :name, :cpf, :birthdate, presence: true
  validates :cpf, length: { is: 14 }
end
