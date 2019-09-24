class RenameColumnInLinks < ActiveRecord::Migration[5.2]
  def change
    rename_column :links, :computer, :computer_link
  end
end
