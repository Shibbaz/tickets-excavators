class DigsiteInfo < ApplicationRecord
  has_one :adress_info
  has_one :near_street
  has_one :intersection
  has_one :excavation_info
end
