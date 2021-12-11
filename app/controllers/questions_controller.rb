class QuestionsController < ApplicationController

  before_action :find_test, only: [:new, :create, :index]
  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  def index
    all_questions = @test.questions

    render plain: all_questions.inspect
  end

  def new
    @question = @test.questions.new
  end

  def show
    question = Question.find(params[:id])
    render plain: question.inspect
  end

  def create
    new_question = @test.questions.create(question_params)

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
    @test = Test.find(params[:test_id])
  end

  def question_not_found
    render plain: 'question not found'
  end
end
