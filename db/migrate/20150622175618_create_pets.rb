class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :link
      t.string :shelter_location
      t.string :shelter_url
      t.string :thumbnail

      t.timestamps null: false
    end
  end
end
