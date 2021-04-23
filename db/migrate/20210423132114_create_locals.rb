class CreateLocals < ActiveRecord::Migration[5.2]
  def change
    create_table :locals do |t|
      t.references :user, foreign_key: true
      t.string :cep
      t.string :address
      t.string :city
      t.string :state
      t.string :district
      t.string :lat
      t.string :lon

      t.timestamps
    end
  end
end
