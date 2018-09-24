class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.boolean :status
      t.date :order_date
      t.decimal :total, default: 0, :precision => 8, :scale => 2
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
