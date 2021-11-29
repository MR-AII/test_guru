class Answer < ApplicationRecord
  belongs_to :question

  validates :title, presence: true

  scope :correct_answers, -> { where(correct: true) }

  def validate_answers_count
    errors.add(:question) if question.answers.count >= 1 && question.answers <= 4
  end
end
