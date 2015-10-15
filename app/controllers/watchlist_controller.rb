class WatchlistController < ApplicationController
  def create
    if !session[:watchlist]
      session[:watchlist] = []
    end
    session[:watchlist] << params[:job_id]
    session[:watchlist].uniq!
    redirect_to profile_path
  end

  def delete
    @current_watchlist.delete_job(params[:format])
    redirect_to watchlist_path
  end

  def update
    if params[:quantity] == "increase"
      @current_watchlist.increase_job_quantity(params[:job_id])
      redirect_to user_path
    elsif params[:quantity] == "decrease"
      @current_watchlist.decrease_job_quantity(params[:job_id])
      redirect_to user_path
    end
  end
  def index
    redirect_to profile_path(current_user)
  end
end