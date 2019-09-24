class CreateComputers < ActiveRecord::Migration[5.2]
  def change
    create_table :computers do |t|
      t.string :connecter_guid
      t.string :hostname
      t.boolean :active
      t.string :connector_version
      t.string :operating_system
      t.string :external_ip
      t.string :group_guid
      t.datetime :install_date
      t.datetime :last_seen

      t.timestamps
    end
  end
end
