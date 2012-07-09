ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "djngo1040",
  :password             => "djengo1234",
  :authentication       => "plain",
  :enable_starttls_auto => true
}