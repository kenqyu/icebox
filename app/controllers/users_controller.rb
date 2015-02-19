class UsersController < ApplicationController
  def new
    @register_user_form = RegisterUserForm.new
  end

  def create
    @register_user = RegisterUserForm.run(params[:register_user])
    if @register_user.valid?
      auto_login(@register_user.result)
      flash[:notice] = 'Welcome! You have signed up successfully.'
      redirect_to dashboard_path
    else
      flash.now[:error] = 'Something went wrong, please try again'
      render :new
    end
  end
end