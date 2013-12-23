class Entry < ActiveRecord::Base

  validates :title, length: { minimum: 1 }
  validates :description, length: { minimum: 1 }
  validates_numericality_of :category_id, only_integer: true, allow_nil: true

  belongs_to :category,
    inverse_of: :entry

end
