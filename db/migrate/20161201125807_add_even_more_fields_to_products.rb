class AddEvenMoreFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :latitude, :float
    add_column :products, :longitute, :float
  end
end
