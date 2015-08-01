class ChangePetsColumns < ActiveRecord::Migration
  def change
  	#change_column :pets, :age, :integer
  	change_column :pets, :age, 'integer USING CAST(age AS integer)'
  end
end