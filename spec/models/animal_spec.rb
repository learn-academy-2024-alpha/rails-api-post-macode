require 'rails_helper'

# Animal.create(common_name: "Platypus", scientific_binomial: "Ornithorhynchus anatinus")


  RSpec.describe Animal, type: :model do
    it'is not valid without a common name' do
    platypus = Animal.create(
      scientific_binomial:"Ornithorhynchus anatinus"
    )
  expect(platypus.errors[:common_name]).to_not be_empty
    end

  it'is not valid without a scientific binomial' do
    platypus = Animal.create(
      common_name:"platypus"
    )
  expect(platypus.errors[:scientific_binomial]).to_not be_empty
    end

    it'is not valid if common name matches the scientific binomial' do
      animal = Animal.create(common_name: "Platypus", scientific_binomial: "Platypus")

      expect(animal.errors[:scientific_binomial].first).to eq("has already been taken")
    end

    it'is not valid if common name is already taken' do
      Animal.create(common_name: "Platypus", scientific_binomial: "Ornithorhynchus anatinus")
      animal = Animal.create(common_name: "Platypus", scientific_binomial: "Ornithorhynchus anatinus")

      expect(animal.errors[:common_name].first).to eq("has already been taken")
      # expect(animal.errors[:scientific_binomial].first).to eq("has already been taken")
    end
  end

