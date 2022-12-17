class CreateResultIntervalJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :simon_results, :simon_intervals do |t|
      t.index :simon_result_id
      t.index :simon_interval_id
    end
  end
end
