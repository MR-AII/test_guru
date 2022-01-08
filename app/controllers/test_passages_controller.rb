class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result]

  def show

  end

  def result

  end

  def update
    @test_passsage.accept!(params[:answer_ids])

    if @test_passsage.completed?
      TestsMailer.completed_test(@test_passsage).deliver_now
      redirect_to result_test_passage_path(@test_passsage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passsage = TestPassage.find(params[:id])
  end

end