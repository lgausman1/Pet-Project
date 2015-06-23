class AddUserIdToPreferences < ActiveRecord::Migration
  def change
  	change_table :preferences do |t|
  	  t.integer :user_id
  	end
  end
end
