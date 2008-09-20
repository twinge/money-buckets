class Bucket < ActiveRecord::Base
  has_many :deposits
  has_many :expenses
  has_many :transactions, :order => "created_at desc"
  
  def self.process_auto
    today = Date.today
    # Weekly
    day_of_week = today.wday + 1
    weekly = Bucket.find(:all, :conditions => {:auto_period => 'week', :auto_day => day_of_week})
    weekly.each do |bucket|
      if !bucket.auto_amount.nil? && bucket.auto_amount > 0
        bucket.deposits << Deposit.new(:amount => bucket.auto_amount)
        bucket.save(false)
      end
    end
    # Monthly
    day_of_month = today.mday
    day_of_month = 'last' if today == today.end_of_month
    monthly = Bucket.find(:all, :conditions => {:auto_period => 'month', :auto_day => day_of_month})
    monthly.each do |bucket|
      if !bucket.auto_amount.nil? && bucket.auto_amount > 0
        bucket.deposits << Deposit.new(:amount => bucket.auto_amount)
        bucket.save(false)
      end
    end
    # Yearly
    day_of_year = today.yday
    yearly = Bucket.find(:all, :conditions => {:auto_period => 'year', :auto_day => day_of_year})
    yearly.each do |bucket|
      if !bucket.auto_amount.nil? && bucket.auto_amount > 0
        bucket.deposits << Deposit.new(:amount => bucket.auto_amount)
        bucket.save(false)
      end
    end
  end
  
  def balance
    transactions.sum(:amount)
  end
end
