class QuestionsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test, only: [index]
  before_action :find_question, only: [index]
  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  def index
    @questions = @test.questions
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_not_found
    render plain: 'question not found'
  end
end
