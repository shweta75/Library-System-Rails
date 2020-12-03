class Student < ApplicationRecord
    validates :first_name, :last_name, :email, :gender, :year_of_birth, :address, :fathers_name, :mothers_name, presence: true
    validates :email, uniqueness: true
    validates :first_name, :last_name, :fathers_name, :mothers_name, length: {minimum: 4}
  
end
