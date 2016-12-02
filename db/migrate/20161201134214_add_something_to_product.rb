class AddSomethingToProduct < ActiveRecord::Migration
  def change
    add_column :products, :longitude, :float
  end
end
