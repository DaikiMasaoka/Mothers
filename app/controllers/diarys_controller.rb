class DiarysController < ApplicationController
  def index
    @diary = Diary.new
    @diarys = Diary.all
  end

  def show

  end

  def create
    @diary = Diary.new(diary_params)
    @diary.save
    redirect_to diarys_path
  end

  def edit
  end

  private
  def diary_params
    params.require(:diary).permit(:title, :body, :image)
  end
end
