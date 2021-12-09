class QuestionsController < ApplicationController

  before_action :find_test

  def index
    all_questions = Question.all

    render plain: all_questions.inspect
  end

  def show
    question = Question.find(params[:id])
    render plain: question.inspect
  end

  def create
    new_question = Question.create(question_params)

    render plain: new_question.inspect
  end

  def destroy
    question = Question.destroy(params[:id]);

    render plain: "#{question.id} will be delete"
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
