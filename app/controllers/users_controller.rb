class UsersController < ApplicationController
 layout :layout?, only: [:index,:new,:reset_password,:change_password]
 before_filter :authenticate_user!, :only => ['index','reset_password','new','change_password']

  def index
    @approved_users = User.all.select {|user| user.approved}
    @pending_users = User.all.reject {|user| user.approved}
    @approved_users= User.where("parent_id = #{current_user.id}")
      #@pending_users= User.where("parent_id = #{current_user.id}")
end



 def new
    @user = User.new
    1.times{@user.images.build}
  end

  def create
    @user = User.new(new_params.merge(parent_id: current_user.id))
  1.times{@user.images.build} if @user.images.blank?
    if @user.save
         UserMailer.welcome_email(@user).deliver
      redirect_to users_path
    else
      render :action => 'new'
    end
  end

  def approve
    @user = User.find params[:id]
    
    @user.update_attributes(approved: true)
    if @user.save
      redirect_to :back, flash: { notice: 'User has successfully been appproved'}
      UserMailer.notify_approval(@user).deliver
    else
      redirect_to :back, flash: { notice: 'Unable to approve user'}
    end
  end

  def destroy
    @user = User.find params[:id]
    if @user.destroy
      redirect_to :back, flash: { notice: 'User has successfully been deleted'}
    else
      redirect_to :back, flash: { notice: 'Unable to delete user'}
    end 
  end


  
def change_password
@user = User.find(params[:id])
end

def reset_password
@user = User.find(params[:id])
@password = params[:user][:password]
@password_confirmation = params[:user][:password_confirmation]
@user.errors.add(:password, "Is required") if (params[:user]).nil? or params[:user][:password].to_s.blank?
if @user.reset_password!(@password, @password_confirmation)
sign_in(:user, @user ,:bypass => true)
flash[:notice] = 'Password has reset successfully.'
redirect_to users_path
else
render :action => 'change_password'
end
end

def change_email
@user = User.find(params[:id])
end

def reset_email
  @user = User.find(params[:id])
  @email = params[:user][:email]
   @user.errors.add(:email, "Is required") if (params[:user]).nil? or params[:user][:email].to_s.blank?
if @user.update_attributes(params[:user])
   sign_in(:user,@user ,:bypass => true)
     flash[:notice] = 'Email has changed successfully.'
       redirect_to users_path
else
render :action => 'change_email'
end
end

  
  private
  
  def new_params
    params.require(:user).permit!
  end

end