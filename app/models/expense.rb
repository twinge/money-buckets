class Expense < Transaction
  def before_save
    self.amount = 0 - self.amount
  end
end
