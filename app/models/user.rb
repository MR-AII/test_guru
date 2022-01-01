class User < ApplicationRecord

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :email, presence: true, uniqueness: true

  scope :users_tests, -> (lvl) {
    joins('join passed_tests, users on tests.id = passed_tests.test_id and users.id = passed_tests.user_id')
      .where(test: {level: lvl}, users: {id: self.id}) }

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end