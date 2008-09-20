class AddAutoDepositColumns < ActiveRecord::Migration
  def self.up
    add_column :buckets, :auto_amount, :decimal, :precision => 8, :scale => 2
    add_column :buckets, :auto_day, :integer
    add_column :buckets, :auto_period, :string
  end

  def self.down
    remove_column :buckets, :auto_period
    remove_column :buckets, :auto_day
    remove_column :buckets, :auto_amount
  end
end
