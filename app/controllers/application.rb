# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  
  before_filter :login_required
  before_filter :adjust_format_for_iphone
  
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  # protect_from_forgery # :secret => '3ec4fc7ff3d481097c3123675c015b22'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  filter_parameter_logging :password
  
  protected
  
  def iphone_user_agent?
    request.env["HTTP_USER_AGENT"] && request.env["HTTP_USER_AGENT"][/(Mobile\/.+Safari)/]
  end

  def iphone_request?
    return true
    return (request.subdomains.first == "iphone" || params[:format] == "iphone" ||
            iphone_user_agent?)
  end
  
  def adjust_format_for_iphone    
    request.format = :iphone if iphone_request?
  end


end
