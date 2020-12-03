class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token

  def sign_in_with(provider_name)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => provider_name) if is_navigational_format?
    else
      flash[:error] = 'There was a problem signing you in through #{provider_name.capitalize}. Please register or try signing in later.'
      redirect_to root_url
    end  
  end

  # def failure
  #   flash[:error] = 'There was a problem signing you in. Please register or try signing in later.' 
  #   redirect_to root_url
  # end

  def facebook
    sign_in_with "Facebook"
  end

  def linkedin
    sign_in_with "LinkedIn"
  end

  def twitter
    sign_in_with "Twitter"
  end

  def google_oauth2
    sign_in_with "Google"
  end

  def microsoft_office365
    sign_in_with "Microsoft"
  end

  # def instagram
  #   sign_in_with "Instagram"
  # end


  def developer
    sign_in_with "Developer"
  end
  def github
    sign_in_with "Github"
  end


end