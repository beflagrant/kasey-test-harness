class Intake < ApplicationRecord
  has_many :assignments
  
  kase_managed
end
