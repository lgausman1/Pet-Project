class AddSurveyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :survey_info, :text
  end
end
