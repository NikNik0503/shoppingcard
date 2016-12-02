class CreateCharacterizations < ActiveRecord::Migration
  def change
    create_table :characterizations do |t|
      t.references :product, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
