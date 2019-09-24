class RemoveComputersFromLinks < ActiveRecord::Migration[5.2]
  def change
    remove_reference :links, :computers, foreign_key: true
    add_reference :links, :computer, foreign_key: true
  end
end
