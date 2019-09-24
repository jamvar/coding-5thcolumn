class Computer < ApplicationRecord
  has_one :link
  has_one :policy

  validates_uniqueness_of :connector_guid
end
