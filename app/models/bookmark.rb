class Bookmark < ApplicationRecord
  validates :comment, length: {minimum: 6, too_short: "The comment must be longer to 6 characters."}
  validates :movie_id, uniqueness: {scope: :list_id, message: "Movie/list couple must be unique."}
  belongs_to :movie
  belongs_to :list
end
