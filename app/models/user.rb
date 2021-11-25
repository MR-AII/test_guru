class User < ApplicationRecord
  has_many :passed_tests
  has_many :tests, dependent: :destroy

  def user_tests(lvl)
    Test.joins('join passed_tests, users on tests.id = passed_tests.test_id and users.id = passed_tests.user_id')
        .where(tests: {level: lvl}, users: {id: self.id})
  end
end