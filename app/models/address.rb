# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :proponent

  validates :street_name, :number, :neighborhood, :city, :state, presence: true
end
