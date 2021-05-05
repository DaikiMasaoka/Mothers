class LikesController < ApplicationController
  def create
    diary = Diary.find(params[:diary_id])
    like = current_user.likes.new(diary_id: diary.id)
    like.save
    redirect_to diary_path(diary)
  end

  def destroy
    diary = Diary.find(params[:diary_id])
    like = current_user.likes.find_by(diary_id: diary.id)
    like.destroy
    redirect_to diary_path(diary)
  end
end
