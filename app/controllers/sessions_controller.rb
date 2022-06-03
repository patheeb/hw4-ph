class SessionsController < ApplicationController
  def new
  end 

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Welcome Back"
        redirect_to "/places"
      else
        flash["notice"] = "Error! Username or password incorrect"
        redirect_to "/sessions"
      end
    else
      flash["notice"] = "Error! Username or password incorrect"
      redirect_to "/sessions"
    end
  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Goodbye."
    redirect_to "/sessions"
  end



end
  