class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :name
      t.references :author, null: false, index: true, foreign_key: { to_table: :users }
      t.integer :amount

      t.timestamps
    end
  end
end
