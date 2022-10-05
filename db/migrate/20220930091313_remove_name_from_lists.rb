class RemoveNameFromLists < ActiveRecord::Migration[6.1]
  def change
    remove_column :lists, :bo, :string
  end
end
