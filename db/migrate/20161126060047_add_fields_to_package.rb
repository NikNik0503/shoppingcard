class AddFieldsToPackage < ActiveRecord::Migration
  def change
    add_column :packages, :often, :integer
  end
end
