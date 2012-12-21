class CreateVoteds < ActiveRecord::Migration
  def change
    create_table :voteds do |t|
      t.integer :userid
      t.integer :pollid

      t.timestamps
    end
  end
end
