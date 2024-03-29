require 'rails_helper'
# Sighting.create(latitude: "-25.2744S", longitude: "133.7751E", date: "2024-03-29")
RSpec.describe Sighting, type: :model do
  it'is not valid without a longitude' do
    platypus = Sighting.create(latitude: "-25.2744S", date: "2024-03-29")
  expect(platypus.errors[:longitude]).to_not be_empty
    end

    it'is not valid without a latitude' do
      platypus = Sighting.create(longitude: "133.7751E", date: "2024-03-29")
    expect(platypus.errors[:latitude]).to_not be_empty
      end

      it'is not valid without a date' do
        platypus = Sighting.create(latitude: "-25.2744S", longitude: "133.7751E")
      expect(platypus.errors[:date]).to_not be_empty
        end

end
