class TestsController < ApplicationController

  def index
    # render plain: 'All tests'

    # render html: '<h1>All tests</h1>'.html_safe

    # render json: { tests:  [Test.all]}

    # render inline: '<p>My favourite launguge is: <%= %[avaJ].reverse! %>!</p>'

    # render file: 'public/about.html', layout: false

    # head :no_content

    # byebug

    # render inline: '<%= console %>'

    logger.info(self.object_id)

    respond_to do | format |
      format.html { render plain: 'All Tests' }
      format.json { render json: { tests: Test.all } }
    end
  end

  def show
    redirect_to root_path
  end
end
