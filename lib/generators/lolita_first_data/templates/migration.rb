class CreateLolitaFirstDataTransaction < ActiveRecord::Migration
  class << self
    def up
      create_table :first_data_transactions do |t|
        t.string :transaction_id, :length => 28
        t.string :transaction_code, :length => 3
        t.string :status, :default => "processing"
        t.references :paymentable, :polymorphic => true
        t.string :ip, :length => 10

        t.timestamps
      end

      add_index :first_data_transactions, [:paymentable_type,:paymentable_id], :name => "fd_trx_paymentable_type_paymentable_id"
    end

    def down
      drop_table :first_data_transactions
    end
  end
end