class Animal < ApplicationRecord
has_many :sightings

validates :common_name, :scientific_binomial, presence: true

validate :name_method

validates :common_name, uniqueness: true

def name_method
  if common_name = scientific_binomial
    errors.add(:scientific_binomial, "has already been taken")
    end
  end
end
