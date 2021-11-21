class Test < ApplicationRecord
  def sort_by_descr(category)
    Test.order(title: :desc).where("title = ?", category)
  end
end
