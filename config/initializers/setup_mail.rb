ActionMailer::Base.smtp_settings = {
  :address              => "info@luis-ramirez.cl",
  :port                 => 587,
  :domain               => "luis-ramirez.cl",
  :user_name            => "",
  :password             => "",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
