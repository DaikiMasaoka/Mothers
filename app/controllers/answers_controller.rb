class AnswersController < ApplicationController
	def create
    @trouble = Trouble.find(params[:trouble_id])
    answer = Answer.new(answer_params)
    answer.trouble_id = @trouble.id
    answer.user_id = current_user.id
    answer.save
	end

  def destroy
    @trouble = Trouble.find(params[:trouble_id])
    answer = @trouble.answers.find(params[:id])
    answer.destroy
  end

  private

  def answer_params
    params.require(:answer).permit(:comment)
  end
end
