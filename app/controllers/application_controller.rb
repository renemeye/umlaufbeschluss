class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= Person.find(session[:person_id]) if session[:person_id]
  end
  helper_method :current_user

	def logged_in?
		return !current_user.nil?
	end
	helper_method :logged_in?

  #use in Code: return if you_shall_not_pass
  def you_shall_not_pass
    redirect_to root_path, :notice => "Du bist nicht angemeldet" if current_user.nil?
    logger.debug "You here the sound of an old man shouting and a stone bridge bursting." if current_user.nil?
    return current_user.nil?
  end

end
