class AddSpeciesToPets < ActiveRecord::Migration
  def change
  	change_table :pets do |t|
  	  t.string :species
  	end
  end
end
