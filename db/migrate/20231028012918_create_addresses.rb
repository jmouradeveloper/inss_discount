class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :street_name, null: false, limit: 64
      t.integer :number, null: false
      t.string :neighborhood, null: false, limit: 64
      t.string :city, null: false, limit: 64
      t.string :state, null: false, limit: 64
      t.references :proponent

      t.timestamps
    end
  end
end
