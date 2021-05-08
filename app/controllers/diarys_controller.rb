class DiarysController < ApplicationController
  def index
    @diary = Diary.new
    @diaries = Diary.all
  end

  def show
    @diary = Diary.find(params[:id])
    @diary_comment = DiaryComment.new
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.user_id = current_user.id
    @diary.save
    redirect_to diarys_path
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_to diarys_path
  end
  
  def update
    diary = Diary.find(params[:id])
    diary.update(diary_params)
    redirect_to diarys_path
  end

  private
  def diary_params
    params.require(:diary).permit(:title, :body, diary_images_images: [])
  end
end
