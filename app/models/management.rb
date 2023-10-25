class Management < ApplicationRecord
  belongs_to :user

  def self.search(search)
    if search != ""
      Management.where('text LIKE(?)', "%#{search}%")
    else
      Management.all
    end
  end
end
