class AnswersController < ApplicationController
	def create
    trouble = Trouble.find(params[:trouble_id])
    comment = current_user.answers.new(answer_params)
    comment.trouble_id = trouble.id
    comment.save
    redirect_to trouble_path(trouble)
	end

  def destroy
    Answer.find_by(id: params[:id], trouble_id: params[:trouble_id]).destroy
    redirect_to trouble_path(params[:trouble_id])
  end

  private

  def answer_params
    params.require(:answer).permit(:comment)
  end
end
