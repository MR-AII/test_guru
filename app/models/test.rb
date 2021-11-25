class Test < ApplicationRecord
  belongs_to :category
  has_many :passed_tests
  has_many :users, through: :passed_tests
  has_many :questions, dependent: :destroy
  belongs_to :user

  def self.sort_by_category(title)
    Test.joins('JOIN categories ON tests.category_id = categories.id')
        .where(categories: {title: title}).order(title: :desc)
  end
end
