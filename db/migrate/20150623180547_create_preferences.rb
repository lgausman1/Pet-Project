class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.string :cat_or_dog
      t.string :activity_level
      t.string :young_children
      t.string :size_of_home
      t.string :time_with_pet
      t.string :training_pet

      t.timestamps null: false
    end
  end
end
