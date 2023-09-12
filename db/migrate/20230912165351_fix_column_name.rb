class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :category_transactions, :transaction_id, :expense_id
  end
end
