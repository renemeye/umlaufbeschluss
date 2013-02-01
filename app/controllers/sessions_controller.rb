class SessionsController < ApplicationController
  def new
  end

  def create
		person = Person.find_by_email(params[:email])
		if person && person.authenticate(params[:password])
      session[:person_id] = person.id
      redirect_to root_url, :notice => "Angemeldet"
    else
      #flash.now.alert = "Invalid email or password"
      #render "new"
      redirect_to root_url, :alert => "Passwort oder E-Mail falsch!"
    end
  end

  def destroy
    session[:person_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
