# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]


 
  def new
    @user = User.new
  end


  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @profile = @user.build_profile
    render :new_profile
 end

  def create_profile
    @user = User.new(session["devise.regist_data"]["user"])
    @profile = Profile.new(profile_params)
    unless @profile.valid?
      flash.now[:alert] = @profile.errors.full_messages
      render :new_profile and return
    end
    @user.build_profile(@profile.attributes)
    session["profile"] = @profile.attributes
    @sending_destination = @user.build_sending_destination
    render :new_sending_destination
  end
 
  def create_sending_destination
    @user = User.new(session["devise.regist_data"]["user"])
    @profile = Profile.new(session["profile"])
    @sending_destination = SendingDestination.new(sending_destination_params)
    unless @sending_destination.valid?
      flash.now[:alert] = @sending_destination.errors.full_messages
      render :new_sending_destination and return
    end
    @user.build_profile(@profile.attributes)
    @user.build_sending_destination(@sending_destination.attributes)
    @user.save
    sign_in(:user, @user)
    redirect_to root_path
  end
 
  protected

  def profile_params
    params.require(:profile).permit(:first_name, :family_name, :first_name_kana, :family_name_kana, :birth_day)
  end

  def sending_destination_params
    params.require(:sending_destination).permit(:destination_first_name, :destination_family_name, :destination_first_name_kana, :destination_family_name_kana, :post_code, :prefecture_code, :city, :house_number, :building_name, :phone_number)
  end
  


end
