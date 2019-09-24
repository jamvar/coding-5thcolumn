class RemoveComputersFromPolicies < ActiveRecord::Migration[5.2]
  def change
    remove_reference :policies, :computers, foreign_key: true
    add_reference :policies, :computer, foreign_key: true
  end
end
