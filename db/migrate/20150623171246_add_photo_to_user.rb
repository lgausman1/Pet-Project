class AddPhotoToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
  	  t.string :photo_url
  	end
  end
end
