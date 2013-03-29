class Users::SessionsController < Devise::SessionsController
  
=begin
  This function is used to render the form for signing in a new user.
=end
  def new
    session[:first_login] = nil
    super
  end
  
=begin
  This function is used to create users session. 
=end 
  def create
    @user = User.find_by_email(params[:user][:email])
    if @user 
        unless @user.valid_password?(params[:user][:password])
          flash[:error] = "Hey #{@user.first_name}, your password incorrect." 
          redirect_to root_url and return
        end
        unless @user.confirmation_status
          flash[:error] = "Hey #{@user.first_name}, Please check your email and confirm."
          redirect_to root_url and return
        end
        session[:first_login] = true
        super 
    else
      flash[:error] = "Email or Password is incorrect." 
      redirect_to root_url
    end
  end

=begin
  This function is used to render the form for signing in a new user.
=end
  def forgot_password
    @user = User.new
  end
  
=begin
  This function is used to recover password. 
=end
  def recover_password
    begin
      @user = User.find_by_email(params[:user][:email])
      UserMailer.send_password_recovery_mail(@user,
                                             edit_password_path(@user.authentication_token),
                                             request.host_with_port)  
      flash[:notice] = "We have sent the password to your email."
    rescue Exception => e
      flash[:notice] = "We have sent the password to your email."
    end
    redirect_to root_path
  end
  
=begin
  This function is used to recover password. 
=end
  def edit_password
    @user = User.find_by_authentication_token(params[:id])
    render "users/passwords/edit" 
  end
  
=begin
  This function is used to update password. 
=end
  def update_password
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Your password was updated successfully!"
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      flash[:error] = "Error updating password!"
      redirect_to edit_password_path(@user.authentication_token)
    end
  end
end