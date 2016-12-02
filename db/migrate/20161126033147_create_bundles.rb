class CreateBundles < ActiveRecord::Migration
  def change
    create_table :bundles do |t|
      t.references :package, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
