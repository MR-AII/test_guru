module Gists
  class Collection
    def self.call
      @client = GitHubClient.new
      @client.gists()
    end
  end
end