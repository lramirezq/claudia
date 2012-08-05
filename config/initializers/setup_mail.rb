ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "grupotc.cl",
  :user_name            => "grupotc.testing",
  :password             => "grupotc125",
  :authentication       => "plain",
  :enable_starttls_auto => true


}
