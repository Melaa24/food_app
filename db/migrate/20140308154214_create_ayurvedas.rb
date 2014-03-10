class CreateAyurvedas < ActiveRecord::Migration
  def change
    create_table :ayurvedas do |t|
      t.string :name

      t.timestamps
    end
  end
end
