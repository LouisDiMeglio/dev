module ApplicationHelper
  # Returns the current logged-in user (if any).
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      @user = User.find_by(id: user_id)
      if @user && @user.authenticated?(cookies[:remember_token])
        log_in @user
        @current_user = @user
      end
    end
  end

  def bootstrap_class_for flash_type
    {
      :success => 'alert-success',
      :error => 'alert-danger',
      :alert => 'alert-warning',
      :notice => 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end
end
