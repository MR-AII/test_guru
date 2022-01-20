class Admin::GistsController < ApplicationController
  before_action :find_gist, only: :destroy

  def index
    @gists = Gist.all
  end

  def fill
    @git_gists = GistQuestionService.new.get_all_gists

    @git_gists.each do |g|
      if current_user.gists.find_by(gist_id: g.id)
        flash[:alert] = "#{g.html_url} already uploaded"
      else
        current_user.gists.create!(question_id: 1,
                    gist_url: g.html_url,
                    gist_id: g.id)
        flash[:notice] = "Gists uploaded!"
      end
    end

    redirect_to admin_gists_path
  end

  def destroy
    @git_gist = GistQuestionService.new.delete_gist(@gist.gist_id)
    @gist.destroy
    flash[:notice] = "#{@gist.gist_url} удален"

    redirect_to admin_gists_path
  end

  def delete_all
    Gist.all.each do |gist|
      GistQuestionService.new.delete_gist(gist.gist_id)
      gist.delete
    end

    flash[:notice] = "All gists deleted!"

    redirect_to admin_gists_path
  end

  private

  def find_gist
    @gist = Gist.find(params[:id])
  end
end