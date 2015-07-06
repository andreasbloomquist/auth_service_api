module SessionsHelper
	
	def login(store)
    session[:store_id] = store.id
    @current_store = store
  end

  def current_store
    return false if session[:store_id] == nil
    @current_store ||= Store.find(session[:store_id])
  end

  def logged_in?
    if current_store == false
      return false
    else
      return true
    end
  end

  def logout
    @current_store = session[:store_id] = nil
    redirect_to root_path
  end

  def redirect_unauthenticated
    unless logged_in?
      flash[:alert] = "Sorry, you must be logged in to see this content"
      return redirect_to login_path
    end
  end
end
