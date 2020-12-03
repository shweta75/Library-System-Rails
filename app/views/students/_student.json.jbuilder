json.extract! student, :id, :first_name, :last_name, :year_of_birth, :gender, :address, :fathers_name, :mothers_name, :email, :created_at, :updated_at
json.url student_url(student, format: :json)
