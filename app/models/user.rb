class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  has_many :rated_movies

  def self.find_movies(list)
    index = 0
    movie_ids = []
    while index < list.length
      movie_ids << list[index]["movie_id"]
      index += 1
    end
    return movie_ids
  end
end
