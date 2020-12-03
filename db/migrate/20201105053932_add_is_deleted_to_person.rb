class AddIsDeletedToPerson < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :isDeleted, :boolean, default: false
  end
end
