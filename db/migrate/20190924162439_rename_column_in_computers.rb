class RenameColumnInComputers < ActiveRecord::Migration[5.2]
  def change
    rename_column :computers, :connecter_guid, :connector_guid
  end
end
