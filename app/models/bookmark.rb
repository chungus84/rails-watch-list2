class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates_length_of :comment, { minimum: 6 }
  validates :movie_id, uniqueness: { scope: :list_id, message: "This Movie is already on the list"}
end
