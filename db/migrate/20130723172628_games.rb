class Games < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :winner_id
      t.time :start_time
      t.time :end_time
    end
  end
end
