class CreateApiResults < ActiveRecord::Migration[5.2]
  def change
    create_table :api_results do |t|
      t.string :item_type
      t.integer :result_count

      t.timestamps
    end
  end
end
