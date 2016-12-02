class AddMoreFieldsToPackage < ActiveRecord::Migration
  def change
    add_column :packages, :packageprice, :decimal, precision: 12, scale: 3
  end
end
