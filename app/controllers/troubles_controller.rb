class TroublesController < ApplicationController
  def index
    @trouble = Trouble.new
    @troubles = Trouble.all
  end

  def show
    @trouble = Trouble.find(params[:id])
    @answer = Answer.new
  end

  def create
    @trouble = Trouble.new(trouble_params)
    @trouble.user_id = current_user.id
    if @trouble.save
       redirect_to troubles_path
    else
      @troubles= Trouble.all
      render 'index'
    end
  end

  def edit
    @trouble = Trouble.find(params[:id])
  end

  def update
    @trouble = Trouble.find(params[:id])
    if @trouble.update(trouble_params)
       redirect_to troubles_path
    else
      render 'edit'
    end
  end

  def destroy
    @trouble = Trouble.find(params[:id])
    @trouble.destroy
    redirect_to troubles_path
  end

  private
  def trouble_params
    params.require(:trouble).permit(:title, :body)
  end
end
