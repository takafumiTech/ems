class Management < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :item_name, uniqueness: true

    with_options numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 },
    format: { with: /\A[0-9]+\z/ } do
      validates :unit
      validates :lead_time
      validates :current_amount
      validates :spare
      validates :consumption_by_delivery
      validates :consumption_by_repair
      validates :consumption_by_exchange    
    end
  end

  def self.search(search)
    if search != ""
      Management.where('text LIKE(?)', "%#{search}%")
    else
      Management.all
    end
  end
end
