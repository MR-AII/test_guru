class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  after_validation :after_validation_next_question

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.current_question += 1
    end

    save!
  end

  def completed?
    current_question.nil?
  end

  def result_in_percentage
    correct_answers.count
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def after_validation_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    correct_answers_count = correct_answers.where(id: answer_ids).count
    correct_answers_count == answer_ids
  end

  def correct_answers
    current_question.answers.correct
  end
end
