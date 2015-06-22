class AddMoreInfoToPets < ActiveRecord::Migration
  def change
  	change_table :pets do |t|
  	  t.string :weight
  	  t.string :gender
  	  t.string :personality
  	  t.string :activity_level
  	end
  end
end
