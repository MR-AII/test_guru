class QuestionsController < ApplicationController

  before_action :find_test, only: [:new, :create, :index]
  before_action :find_question, only: [:edit, :update, :show]
  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  def index
    @questions = @test.questions
  end

  def new
    @question = @test.questions.new
  end

  def edit

  end

  def update
    if @question.update(question_params)
      redirect_to @question.test
    else
      render :edit
    end
  end

  def show

  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @question.test
    else
      render :new
    end
  end

  def destroy
    @question = Question.destroy(params[:id])

    @question.destroy
    redirect_to test_path(@question)
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :test_id)
  end

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
