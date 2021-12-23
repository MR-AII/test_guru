class Answer < ApplicationRecord
  belongs_to :question

  validates :title, presence: true, uniqueness: true
  validate :validate_answers_count, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_count
    errors.add(:question) if question.answers.count >= 4
  end
end
