class ConsumptionType < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'DC併設営業所' },
    { id: 3, name: 'CSC併設営業所' },
    { id: 4, name: '単体営業所' }
  ]

  include ActiveHash::Associations
  has_many :users
end
