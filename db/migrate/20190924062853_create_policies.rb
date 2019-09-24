class CreatePolicies < ActiveRecord::Migration[5.2]
  def change
    create_table :policies do |t|
      t.references :computers, foreign_key: true
      t.string :guid
      t.string :name

      t.timestamps
    end
  end
end
