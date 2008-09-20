class UsersController < ApplicationController
  
  skip_before_filter :login_required, :only => [:new, :create]

  # render new.rhtml
  def new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
      format.js
      format.iphone { render :layout => false}
    end
  end
  
  def edit
    @user = current_user
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
      format.js
      format.iphone { render :layout => false}
    end
  end
  
  def update
    @user = current_user
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'Profile was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
        format.iphone  { redirect_to(buckets_path) }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        format.iphone { render :action => "edit", :layout => false}
      end
    end
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!"
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin."
      render :action => 'new'
    end
  end
end
