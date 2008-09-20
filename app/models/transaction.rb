class Transaction < ActiveRecord::Base
  validates_numericality_of :amount
end
