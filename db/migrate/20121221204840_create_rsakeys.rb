class CreateRsakeys < ActiveRecord::Migration
  def change
    create_table :rsakeys do |t|
      t.integer :userid
      t.string :marshkey

      t.timestamps
    end
  end
end
