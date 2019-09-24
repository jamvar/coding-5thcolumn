class CreateApiCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :api_credentials do |t|
      t.string :api_name
      t.string :api_id
      t.string :api_key

      t.timestamps
    end
  end
end
