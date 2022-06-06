class CreateUniversities < ActiveRecord::Migration[7.0]
  def change
    create_table :universities do |t|
      t.string :universidad
      t.string :pais

      t.timestamps
    end
  end
end
