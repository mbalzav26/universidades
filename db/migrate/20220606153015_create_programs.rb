class CreatePrograms < ActiveRecord::Migration[7.0]
  def change
    create_table :programs do |t|
      t.string :nombre
      t.string :beca
      t.string :requisito
      t.text :descripcion
      t.references :university, null: false, foreign_key: true

      t.timestamps
    end
  end
end
