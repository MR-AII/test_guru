class Test < ApplicationRecord
  belongs_to :category
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  has_many :questions, dependent: :destroy
  belongs_to :author, class_name: 'User'

  validates :title, uniqueness: { scope: :level, message: 'There can be only one Test with the given name and level' }, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validate :validate_max_level, on: [:create, :update]

  scope :difficult_levels, -> (level) { where("level = ?", level) }
  scope :easy, -> { where(level: (0..1)) }
  scope :medium, -> { where(level: (2..4)) }
  scope :hard, -> { where(level: (5..Float::INFINITY)) }
  scope :sort_by_category, -> (title) { joins('JOIN categories ON tests.category_id = categories.id')
                                  .where(categories: {title: title}).order(title: :desc) }

  private

  def validate_max_level
    errors.add(:level) if level.to_i > 10
  end
end
