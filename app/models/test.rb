class Test < ApplicationRecord
  def self.sort_by_category(title)
    Test.joins('JOIN categories ON tests.category_id = categories.id')
        .where(categories: {title: title}).order(title: :desc)
  end
end
