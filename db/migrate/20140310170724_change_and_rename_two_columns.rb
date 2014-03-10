class ChangeAndRenameTwoColumns < ActiveRecord::Migration
  def change
  	rename_column :users, :studio, :studio_id
  	change_column :users, :studio_id, :integer

  	rename_column :users, :ayurveda, :ayurveda_id
  	change_column :users, :ayurveda_id, :integer
  end
end
