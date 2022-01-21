module Gists
  class SaveGists
    def self.call(context)
      context[:collection_gists].each do |gist|
        unless context[:current_user].gists.find_by(gist_id: gist.id)
          context[:current_user].gists.create!(question_id: 1,
                                     gist_url: gist.html_url,
                                     gist_id: gist.id)
        end
      end
    end
  end
end