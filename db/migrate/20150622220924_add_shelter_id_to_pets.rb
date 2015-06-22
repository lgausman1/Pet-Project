class AddShelterIdToPets < ActiveRecord::Migration
  def change
  	change_table :pets do |t|
  	  t.integer :shelter_id
  	end
  end
end
