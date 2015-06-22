class AddAgeToPets < ActiveRecord::Migration
  def change
  	change_table :pets do |t|
  	  t.string :age
  	end
  end
end
