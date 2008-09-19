class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.decimal :amount, :precision => 8, :scale => 2
      t.integer :bucket_id
      t.string :type, :description
      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
