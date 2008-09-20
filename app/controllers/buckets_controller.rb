class BucketsController < ApplicationController
  # GET /buckets
  # GET /buckets.xml
  def index
    @buckets = current_user.buckets.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @buckets }
      format.iphone
    end
  end

  # GET /buckets/1
  # GET /buckets/1.xml
  def show
    @bucket = current_user.buckets.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bucket }
      format.iphone { render :layout => false}
    end
  end

  # GET /buckets/new
  # GET /buckets/new.xml
  def new
    @bucket = current_user.buckets.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bucket }
      format.iphone { render :layout => false}
    end
  end

  # GET /buckets/1/edit
  def edit
    @bucket = current_user.buckets.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bucket }
      format.iphone { render :layout => false}
    end
  end

  # POST /buckets
  # POST /buckets.xml
  def create
    @bucket = current_user.buckets.new(params[:bucket])

    respond_to do |format|
      if @bucket.save
        flash[:notice] = 'Bucket was successfully created.'
        format.html { redirect_to(buckets_path) }
        format.xml  { render :xml => @bucket, :status => :created, :location => @bucket }
        format.iphone { redirect_to(buckets_path) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bucket.errors, :status => :unprocessable_entity }
        format.iphone { render :action => "new", :layout => false}
      end
    end
  end

  # PUT /buckets/1
  # PUT /buckets/1.xml
  def update
    @bucket = current_user.buckets.find(params[:id])
    respond_to do |format|
      if @bucket.update_attributes(params[:bucket])
        flash[:notice] = 'Bucket was successfully updated.'
        format.html { redirect_to(@bucket) }
        format.xml  { head :ok }
        format.iphone  { redirect_to(@bucket) }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bucket.errors, :status => :unprocessable_entity }
        format.iphone { render :action => "edit", :layout => false}
      end
    end
  end

  # DELETE /buckets/1
  # DELETE /buckets/1.xml
  def destroy
    @bucket = current_user.buckets.find(params[:id])
    @bucket.destroy

    respond_to do |format|
      format.html { redirect_to(buckets_url) }
      format.xml  { head :ok }
      format.iphone { render :layout => false}
    end
  end
  
  def process_auto
    Bucket.process_auto
    render :nothing => true
  end
end
