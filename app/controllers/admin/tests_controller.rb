class Admin::TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: [:show, :edit, :update, :destroy, :start]
  after_action :send_log_message
  around_action :log_execute_time

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show

  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  def new
    @test = Test.new
  end

  def edit

  end

  def create
    @test = Test.new(test_params)
    @test.user_id = current_user.id

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    if @test.destroy
      redirect_to tests_path
    else
      render :index
    end
  end

  def search
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    render plain: result.join("\n")
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def send_log_message
    logger.info("Action [#{action_name}] was finished")
  end

  def log_execute_time
    start = Time.now
    yield
    finish = Time.now - start

    logger.info("execution time: #{finish * 1000}ms")
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :user_id)
  end
end