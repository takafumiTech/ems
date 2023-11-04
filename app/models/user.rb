class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :consumption_type
  has_many   :daily_count

  with_options presence: true do
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
      validates :center_name
    end

    with_options numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 },
                 format: { with: /\A[0-9]+\z/ } do
      validates :center_code
      validates :yearly_delivery
    end
  end

  validates :consumption_type_id, numericality: { other_than: 1, message: "can't be blank" }
end
