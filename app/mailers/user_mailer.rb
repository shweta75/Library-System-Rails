class UserMailer < ApplicationMailer

  def welcome_email
    user = User.last
    email = [user.email, "shwetapathade4@gmail.com"]
    mail(to: email, subject: "Number of books you read")
  end
end