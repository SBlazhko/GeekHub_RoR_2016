class Product < ApplicationRecord
  paginates_per 5

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
