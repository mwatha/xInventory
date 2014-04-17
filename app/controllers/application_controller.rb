class ApplicationController < ActionController::Base
  protect_from_forgery                                                          
                                                                                
  before_filter :perform_basic_auth, :except => ['login','logout']                         

  def admin?                                                                    
    User.current_user.user_roles.map(&:role).include?('admin')                  
  end

  def check_authorized
    unless admin?
      redirect_to '/'
    end
  end

                                                                                 
  protected                                                                     
                                                                                
  def perform_basic_auth                                                        
    if session[:user_id].blank?                                                 
      respond_to do |format|                                                    
        format.html { redirect_to :controller => 'user',:action => 'logout' }   
      end                                                                       
    elsif not session[:user_id].blank?                                          
      User.current_user = User.where(:'id' => session[:user_id]).first        
    end                                                                         
  end 

end
