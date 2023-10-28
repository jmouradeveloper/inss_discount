class CreateProponents < ActiveRecord::Migration[7.0]
  def change
    create_table :proponents do |t|
      t.string :name, null: false, limit: 64
      t.string :cpf, null: false, limit: 14
      t.timestamp :birthdate, null: false, limit: 64
      t.decimal :wage

      t.timestamps
    end
  end
end
