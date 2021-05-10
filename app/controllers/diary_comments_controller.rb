class DiaryCommentsController < ApplicationController

  def create
    @diary = Diary.find(params[:diary_id])
    diary_comment = DiaryComment.new(diary_comment_params)
    diary_comment.diary_id = @diary.id
    diary_comment.user_id = current_user.id
    diary_comment.save
    redirect_to diary_path(diary)
  end

  def destroy
    DiaryComment.find_by(id: params[:id], diary_id: params[:diary_id]).destroy
    redirect_to diary_path(params[:diary_id])
  end

  private

  def diary_comment_params
    params.require(:diary_comment).permit(:comment)
  end
end
