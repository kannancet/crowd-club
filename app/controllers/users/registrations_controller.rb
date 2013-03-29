class Users::RegistrationsController < ApplicationController

=begin
  This function is used to create users from the sunscription app. 
=end 
  def sign_up
    begin
     @user = User.new(:email => params[:email],
                      :password => params[:password],
                      :first_name => params[:first_name],
                      :last_name => params[:last_name],
                      :confirmation_token => set_confirmation_token,
                      :confirmation_sent_at => Time.now,
                      :confirmation_status => false)
    if @user.save!
      flash[:notice]  = "Hi #{@user.first_name}, Please check you email to activate CrowdClub."
      @user.ensure_authentication_token!
      UserMailer.send_activation_mail(@user,
                                      user_account_activation_path(@user.confirmation_token),
                                      request.host_with_port)
    end
   rescue Exception => e
     flash[:error]  = e.message
   end
   redirect_to request.referer
  end
  
=begin
  This function is used to activate the account 
=end
  def activate_account
    user = User.find_by_confirmation_token(params[:confirmation_token])
    if user && (Time.diff(Time.now, user.confirmation_sent_at)[:day] <= 2)
      user.update_attributes!(:confirmed_at => Time.now,
                              :confirmation_status => true)
      flash[:notice] = 'Your account has been activated successfully.Please signin to continue.'
    else
      flash[:alert] = 'Url expired'
    end
  end
  
end
