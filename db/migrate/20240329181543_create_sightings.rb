class CreateSightings < ActiveRecord::Migration[7.1]
  def change
    create_table :sightings do |t|
      t.string :latitude
      t.string :longitude
      t.date :date
      t.integer :animal_id

      t.timestamps
    end
  end
end
