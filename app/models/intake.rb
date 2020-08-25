class Intake < ApplicationRecord
  # has_one :kase, class_name: "Kasey::Kase"
  has_many :assignments

  kase_managed

  private
end
