class CreateAnimals < ActiveRecord::Migration[5.1]
  def change
    create_table :animals do |t|
      t.text :name
      t.integer :longevity
      t.text :preys_id
      t.text :predators_id

      t.timestamps
    end
  end
end
