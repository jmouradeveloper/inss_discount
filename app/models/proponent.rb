class Proponent < ApplicationRecord
  has_one :address
  has_many :contact_phones

  validates :name, :cpf, :birthdate, presence: true
  validates_length_of :cpf, is: 14
end
