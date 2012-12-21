class AddMarshkeyToRsakeys < ActiveRecord::Migration
  def change
    add_column :rsakeys, :marshkey, :binary
  end
end
