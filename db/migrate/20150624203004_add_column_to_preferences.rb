class AddColumnToPreferences < ActiveRecord::Migration
  def change
  	change_table :preferences do |t|
  	  t.string :user_personality
  	end
  end
end
