class Link < ApplicationRecord

  validates :short_name, presence: true, uniqueness: true
  validates :url, presence: true

end
