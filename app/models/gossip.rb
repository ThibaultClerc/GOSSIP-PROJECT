class Gossip < ApplicationRecord
  belongs_to :user
  has_many :gossip_tags
  has_many :tags, through: :gossip_tags
  has_many :authors, foreign_key: 'author_id', class_name: "User"
  has_many :comments
  validates :title,
    presence: true
    # length: { in: 3..14 }

  validates :content,
    presence: true

end