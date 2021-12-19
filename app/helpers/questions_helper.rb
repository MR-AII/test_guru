module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "Create new #{@test.title} question"
    else edit_question_path
      "Edit #{question.title} question"
    end
  end

  def current_year
    "#{Time.now.year}"
  end

  def git_hub
    link_to 'Psyker-h', "https://github.com/Psyker-h/test_guru", target: '_blank'
  end
end
