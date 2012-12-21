class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.text :question
      t.text :option_a
      t.integer :option_a_score
      t.text :option_b
      t.integer :option_b_score
      t.text :option_c
      t.integer :option_c_score
      t.text :option_d
      t.integer :option_d_score

      t.timestamps
    end
  end
end
