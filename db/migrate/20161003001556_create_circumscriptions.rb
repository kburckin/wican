class CreateCircumscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :circumscriptions do |t|
      t.integer :number, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
