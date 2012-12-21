class RemoveMarshkeyFromRsakeys < ActiveRecord::Migration
  def up
    remove_column :rsakeys, :marshkey
  end

  def down
    add_column :rsakeys, :marshkey, :string
  end
end
