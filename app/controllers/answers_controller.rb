class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_question, only: %i[index]

  def index
    @question.answers.all
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end
end