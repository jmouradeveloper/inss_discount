# frozen_string_literal: true

class CreateContactPhones < ActiveRecord::Migration[7.0]
  def change
    create_table :contact_phones do |t|
      t.string :number, null: false
      t.string :contact_type, null: false
      t.references :proponent

      t.timestamps
    end
  end
end
