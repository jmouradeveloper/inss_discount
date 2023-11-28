# frozen_string_literal: true

json.extract! proponent, :id, :created_at, :updated_at
json.url proponent_url(proponent, format: :json)
