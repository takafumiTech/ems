class DailyCount < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :date, uniqueness: true

    with_options numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 },
    format: { with: /\A[0-9]+\z/ } do
      validates :delivery_count
      validates :repair_count
      validates :exchange_count
    end
  end
end
