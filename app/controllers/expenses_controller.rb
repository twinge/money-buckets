class ExpensesController < ApplicationController
  before_filter :find_bucket
  before_filter :find_expense, :only => [:show, :edit, :update, :destroy]

  # GET /expenses/new
  # GET /expenses/new.xml
  def new
    @expense = @bucket.expenses.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @expense }
      format.js
    end
  end


  # POST /expenses
  # POST /expenses.xml
  def create
    @expense = @bucket.expenses.new(params[:expense])

    respond_to do |format|
      if @expense.save
        flash[:notice] = 'Expense was successfully created.'
        format.html { redirect_to(@expense) }
        format.xml  { render :xml => @expense, :status => :created, :location => @expense }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @expense.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end


  # DELETE /expenses/1
  # DELETE /expenses/1.xml
  def destroy
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to(expenses_url) }
      format.xml  { head :ok }
      format.js
    end
  end
  
  protected
  
  def find_bucket
    @bucket = Bucket.find(params[:bucket_id])
  end
  
  def find_expense
    @expense = @bucket.expenses.find(params[:id])
  end
end
