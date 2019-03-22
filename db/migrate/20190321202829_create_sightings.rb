class CreateSightings < ActiveRecord::Migration[5.2]
  def change
    create_table :sightings do |t|
      t.date :date
      t.time :time
      t.string :latitude
      t.string :longitude
      t.belongs_to :animal, index: true
      t.timestamps
    end
  end
end
