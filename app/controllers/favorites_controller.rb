class FavoritesController < ApplicationController
  before_action :logged_in_user
  
  def index
    @favorite_topics = current_user.favorite_topics
  end
  
  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]
    if favorite.save
      redirect_to topics_path
      flash[:success] = 'いいねをしました'
    else
      redirect_to topics_path
      flash[:danger]  = 'いいねに失敗しました'
    end
  end
  
  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    @favorite.destroy
    redirect_to topics_path
    flash[:success] = 'いいねを取り消しました'
  end
  
  private
  
   #ログイン済みユーザーかどうかを確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end
    
end
