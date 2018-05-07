class Quote < ApplicationRecord
  validates :author, presence: true
  validates :content, presence: true
# scope for searching for author and content
# where - like ? allows for a little more flexible search query?
# need % for the string interpolation for for it to work with the api call?
  scope :search_author, -> (author) { where("author like ?", "%#{author}%")}
  scope :search_content, -> (content { where("content like ?", "%#{content}%")})
end
