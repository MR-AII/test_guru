module Gists
  class Create
    def initialize(question = Question.first, client: nil)
      @question = question
      @test = @question.test
      @client = client || GitHubClient.new
    end

    def call
      @client.create_gist(gist_params)
    end

    private

    def gist_params
      {
        description: I18n.t('.gist_description', test_title: @test.title),
        files: {
          'test-guru-question.txt' => {
            content: gist_content
          }
        }
      }
    end

    def gist_content
      content = [@question.body]
      content += @question.answers.pluck(:title)
      content.join("\n")
    end
  end
end