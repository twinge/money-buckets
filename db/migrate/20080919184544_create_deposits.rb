class CreateDeposits < ActiveRecord::Migration
  def self.up
    create_table :deposits do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :deposits
  end
end
