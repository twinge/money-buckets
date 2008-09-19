class DepositsController < ApplicationController
  before_filter :find_bucket
  before_filter :find_deposit, :only => [:show, :edit, :update, :destroy]

  # GET /deposits/new
  # GET /deposits/new.xml
  def new
    @deposit = @bucket.deposits.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @deposit }
      format.js
    end
  end


  # POST /deposits
  # POST /deposits.xml
  def create
    @deposit = @bucket.deposits.new(params[:deposit])

    respond_to do |format|
      if @deposit.save
        flash[:notice] = 'Deposit was successfully created.'
        format.html { redirect_to(@deposit) }
        format.xml  { render :xml => @deposit, :status => :created, :location => @deposit }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @deposit.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end


  # DELETE /deposits/1
  # DELETE /deposits/1.xml
  def destroy
    @deposit.destroy

    respond_to do |format|
      format.html { redirect_to(deposits_url) }
      format.xml  { head :ok }
      format.js
    end
  end
  
  protected
  
  def find_bucket
    @bucket = Bucket.find(params[:bucket_id])
  end
  
  def find_deposit
    @deposit = @bucket.deposits.find(params[:id])
  end
end
