class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :consumption_type
       
  with_options presence: true do
    validates :yearly_delivery
    
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
      validates :center_name
    end

    with_options format: { with: /\A[0-9]+\z/, messages: 'must be a number' } do
      validates :center_code
    end
  end

  validates :consumption_type_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
