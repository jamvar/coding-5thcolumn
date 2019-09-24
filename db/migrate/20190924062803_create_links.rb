class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.references :computers, foreign_key: true
      t.string :computer
      t.string :trajectory
      t.string :group

      t.timestamps
    end
  end
end
