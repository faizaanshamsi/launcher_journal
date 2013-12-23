class Category < ActiveRecord::Base
  validates_uniqueness_of :name
  validates :name, length: { minimum: 1 }

  has_many :entries,
    inverse_of: :category
end
