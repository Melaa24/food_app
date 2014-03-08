class AddOptionalProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :aliment, :string
    add_column :users, :allergy, :string
    add_column :users, :birthday, :string
    add_column :users, :gender, :string
    add_column :users, :location, :string
    add_column :users, :phone, :string
  end
end
