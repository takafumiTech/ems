class CreateDailyCounts < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_counts do |t|
      t.date       :date,           null: false
      t.integer    :delivery_count, null: false
      t.integer    :repair_count,   null: false
      t.integer    :exchange_count, null: false
      t.references :user,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
