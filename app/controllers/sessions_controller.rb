class SessionsController < ApplicationController


  def signin
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.find_by(email: params[:user][:email])
    # binding.pry
    # if @user
    if  @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id

      redirect_to :root
      # user_path(@user)
  else
    flash[:error] = "Error"
    render :signin
    end
  # end
  end

  def destroy
    session.delete :user_id
    session.delete :total
    redirect_to root_path
  end
end
