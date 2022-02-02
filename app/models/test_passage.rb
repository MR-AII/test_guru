class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_save :before_validation_set_first_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def result_in_percentage
    (correct_questions * 100) / count_questions
  end

  def successfully?
    if result_in_percentage >= 85
      true
    else
      false
    end
  end

  def persentage_in_progress_bar
    ((current_question_number.to_f / count_questions.to_f) * 100).to_i
  end

  def count_questions
    test.questions.count
  end

  def current_question_number
    test.questions.order(:id).where('id <= ?', current_question.id).count
  end

  private

  def before_validation_set_first_question
    self.current_question = if new_record?
                              test.questions.first
                            else
                              next_questions.first
                            end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_questions
    test.questions.order(:id).where('id > ?', current_question.id)
  end
end
