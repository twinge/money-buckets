class Bucket < ActiveRecord::Base
  has_many :deposits
  has_many :expenses
  has_many :transactions, :order => "created_at desc"
end
