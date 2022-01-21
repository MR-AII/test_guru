module Gists
  class Destroy
    def self.call(gists)
      @client = GitHubClient.new
      gists.each do |gist|
        @client.delete_gist(gist.gist_id)
        gist.destroy
      end
    end
  end
end