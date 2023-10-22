class CreateManagements < ActiveRecord::Migration[6.0]
  def change
    create_table :managements do |t|
      t.string     :item_code,               null: false
      t.string     :item_name,               null: false
      t.integer    :unit,                    null: false
      t.integer    :lead_time,               null: false
      t.integer    :price,                   null: false
      t.integer    :current_amount,          null: false
      t.integer    :spare,                   null: false
      t.integer    :consumption_by_delivery, null: false
      t.integer    :consumption_by_repair,   null: false
      t.integer    :consumption_by_exchange, null: false
      t.references :user,                    null: false, foreign_key: true
      t.timestamps
    end
  end
end
