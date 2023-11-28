# frozen_string_literal: true

class ContactPhone < ApplicationRecord
  belongs_to :proponent

  validates :number, :contact_type, presence: true
end
