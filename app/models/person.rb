class Person < ApplicationRecord
#  encrypted_id key: "jhye0e97hjsjsjsjsjsbhtje"
  validates :first_name, :last_name, :email, :age, :gender, presence: true
  validates :email, uniqueness: true
  validates :first_name, :last_name, length: {minimum: 4}

  scope :active_persons_with_long_name, -> { where("LENGTH(first_name) > 6").where(isDeleted: false) }
end