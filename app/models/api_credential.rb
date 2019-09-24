class ApiCredential < ApplicationRecord
  validates_presence_of :api_name, :api_id, :api_key
  validates_uniqueness_of :api_name, :api_id, :api_key
end
