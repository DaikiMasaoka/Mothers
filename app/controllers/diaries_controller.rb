class DiariesController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
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
    if @diary.save
       redirect_to diaries_path
    else
      @diaries=Diary.all
      render 'index'
    end
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_to diaries_path
  end

  def update
    @diary = Diary.find(params[:id])
    if @diary.update(diary_params)
       redirect_to diaries_path
    else
      render 'edit'
    end

  end

  private
  def diary_params
    params.require(:diary).permit(:title, :body, diary_images_images: [])
  end
end
