class AddDescriptionToPets < ActiveRecord::Migration
  def change
  	change_table :pets do |t|
  	  t.string :description
  	end
  end
end
