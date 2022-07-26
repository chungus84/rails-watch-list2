class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates_presence_of :movie, :list
  validates :comment, length: { minimum: 6 }
  validates :movie, uniqueness: { scope: :list, message: "This Movie is already on the list"}
end
