class CustomAuthenticationFailure < Devise::FailureApp 
  protected 
    def redirect_url 
      root_path #rootに飛ばす場合
    end 
  end 