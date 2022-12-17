class CreateSimonResults < ActiveRecord::Migration[7.0]
  def change
    create_table :simon_results do |t|
      t.integer :value
      t.integer :n_num
      t.integer :n_fact

      t.timestamps
    end
  end
end
