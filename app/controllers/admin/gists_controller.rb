class Admin::GistsController < ApplicationController
  before_action :find_gist, only: :destroy

  def index
    @gists = Gist.all
  end

  def fill
    @git_gists = Gists::Collection.call
    Gists::SaveGists.call({ collection_gists: @git_gists, current_user: current_user })

    redirect_to admin_gists_path
  end

  def destroy
    Gists::Destroy.call([@gist])
    flash[:notice] = "#{@gist.gist_url} удален"

    redirect_to admin_gists_path
  end

  def delete_all
    Gists::Destroy.call(Gist.all)
    flash[:notice] = "All gists deleted!"

    redirect_to admin_gists_path
  end

  private

  def find_gist
    @gist = Gist.find(params[:id])
  end
end