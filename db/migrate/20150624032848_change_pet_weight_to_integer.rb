class ChangePetWeightToInteger < ActiveRecord::Migration
  def change
  	#change_column :pets, :weight, :integer
  	change_column :pets, :weight, 'integer USING CAST(weight AS integer)'
  end
end
