class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # Implementaremos este método en nuestro modelo más adelante
    auth = request.env['omniauth.auth']
    @user = User.from_omniauth(auth)
    #@user.name = auth.info.name
    #@user.profile_picture = auth.info.image
    if @user.persisted?
      session[:user_id] = @user.id
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => 'Facebook') if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end