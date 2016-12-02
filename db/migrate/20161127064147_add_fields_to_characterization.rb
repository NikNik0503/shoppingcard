class AddFieldsToCharacterization < ActiveRecord::Migration
  def change
    add_reference :characterizations, :package, index: true, foreign_key: true
  end
end
