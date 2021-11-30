class User < ApplicationRecord
  has_many :passed_tests
  has_many :tests, dependent: :destroy

  validates :email, presence: true, uniqueness: true

  scope :users_tests, -> (lvl) {
    joins('join passed_tests, users on tests.id = passed_tests.test_id and users.id = passed_tests.user_id')
      .where(test: {level: lvl}, users: {id: self.id}) }
end