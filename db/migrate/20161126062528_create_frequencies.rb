class CreateFrequencies < ActiveRecord::Migration
  def change
    create_table :frequencies do |t|
      t.references :product, index: true, foreign_key: true
      t.references :package, index: true, foreign_key: true
      t.integer :numb

      t.timestamps null: false
    end
  end
end
