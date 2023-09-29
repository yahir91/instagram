class FollowsController < ApplicationController
  before_action :set_user, only: [:folllow, :unfollow, :cancel_requests]
  before_action :set_follow_req, only: [:accept_follow, :decline_follow, :cancel_requests]

  def follow
    current_user.follow(@user)
    redirect_back(fallback: root_path)
  end

  def cancel_requests
    current_user.cancel_request(@user)
    redirect_back(fallback: root_path)
  end

  def unfollow
    current_user.unfollow(@user)
    redirect_back(fallback: root_path)
  end

  def accept_follow
    @follow_req.accept
    redirect_back(fallback: root_path)
  end

  def decline_follow
    @follow_req.destroy
    redirect_back(fallback: root_path)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_follow_req
    @follow_req = Follow.find(params[:follow_id])
  end
end
