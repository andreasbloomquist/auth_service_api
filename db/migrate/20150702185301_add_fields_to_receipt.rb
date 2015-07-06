class AddFieldsToReceipt < ActiveRecord::Migration
  def change
  	add_column :receipts, :customer_info, :json
		add_column :receipts, :items, :json
		add_column :receipts, :item_count, :integer
		add_column :receipts, :taxes, :decimal
		rename_column :receipts, :amount, :subtotal
		add_column :receipts, :tender_amount, :decimal
		add_column :receipts, :change_due, :decimal
  end
end
