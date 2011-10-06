class Main;end

class Main::Controller
  include App::Controller

  def current_user
    @current_user ||= if request.session[:user_id]
      User.get request.session[:user_id]
    else
      user = User.create
      request.session[:user_id] = user.id
      user
    end
  end
end
