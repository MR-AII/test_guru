class User < ApplicationRecord
  def self.all_test(lvl)
    Test.all.where("level = ?", lvl)
  end
end