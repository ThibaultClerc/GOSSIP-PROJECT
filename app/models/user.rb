class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"

  has_many :comments, foreign_key: 'author_id', class_name: "Comment"
  
  validates :first_name,
    presence: true,
    length: { in: 3..14 }
    # format: {with: /[a-zA-Z-éàôê'ç^ÿ& ]/}

  validates :last_name,
    presence: true,
    length: { in: 3..25 }
    # format: {with: /[a-zA-Z-éàôê'ç^ÿ& ]/}

  validates :description,
    presence: true
    # length: { minimum: 140 }

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

  validates :age,
    presence: true
    # format: { with: /[1-99]/ }

end