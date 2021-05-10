class LikesController < ApplicationController
  def create
    @diary = Diary.find(params[:diary_id])
    like = @diary.likes.new(user_id: current_user.id)
    like.save
  end

  def destroy
    @diary = Diary.find(params[:diary_id])
    like = @diary.likes.find_by(user_id: current_user.id)
    like.destroy
  end
end
