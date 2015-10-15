class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :create_watchlist
  before_action :create_watchlist
  helper_method :current_user

  def create_watchlist
    @current_watchlist = Watchlist.new(session[:watchlist])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
